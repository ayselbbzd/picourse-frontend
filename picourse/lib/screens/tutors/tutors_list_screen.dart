// lib/screens/tutors/tutor_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/tutor_provider.dart';
import '../../providers/auth_provider.dart';
import '../../models/subject.dart';
import 'tutor_detail_screen.dart';

class TutorListScreen extends ConsumerStatefulWidget {
  const TutorListScreen({super.key});

  @override
  ConsumerState<TutorListScreen> createState() => _TutorListScreenState();
}

class _TutorListScreenState extends ConsumerState<TutorListScreen> {
  final _searchController = TextEditingController();
  Subject? _selectedSubject;
  String _selectedOrdering = '-rating';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    ref.read(tutorProvider.notifier).loadTutors(
      subjectId: _selectedSubject?.id,
      search: _searchController.text.trim().isEmpty ? null : _searchController.text.trim(),
      ordering: _selectedOrdering,
    );
  }

  Future<void> _logout() async {
    await ref.read(authProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context) {
    final tutorState = ref.watch(tutorProvider);
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Tutors'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Welcome, ${authState.user?.firstName ?? "User"}'),
                enabled: false,
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'logout') {
                _logout();
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search and Filter Section
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade50,
            child: Column(
              children: [
                // Search bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search tutors by name or bio...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onSubmitted: (_) => _applyFilters(),
                ),
                const SizedBox(height: 12),
                
                // Filters row
                Row(
                  children: [
                    // Subject filter
                    Expanded(
                      child: DropdownButtonFormField<Subject>(
                        value: _selectedSubject,
                        decoration: const InputDecoration(
                          labelText: 'Subject',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        items: [
                          const DropdownMenuItem<Subject>(
                            value: null,
                            child: Text('All Subjects'),
                          ),
                          ...tutorState.subjects.map(
                            (subject) => DropdownMenuItem(
                              value: subject,
                              child: Text(subject.name),
                            ),
                          ),
                        ],
                        onChanged: (subject) {
                          setState(() {
                            _selectedSubject = subject;
                          });
                          _applyFilters();
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    
                    // Sort filter
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedOrdering,
                        decoration: const InputDecoration(
                          labelText: 'Sort by',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: '-rating',
                            child: Text('Highest Rating'),
                          ),
                          DropdownMenuItem(
                            value: 'rating',
                            child: Text('Lowest Rating'),
                          ),
                          DropdownMenuItem(
                            value: 'hourly_rate',
                            child: Text('Price: Low to High'),
                          ),
                          DropdownMenuItem(
                            value: '-hourly_rate',
                            child: Text('Price: High to Low'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedOrdering = value!;
                          });
                          _applyFilters();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Tutors list
          Expanded(
            child: tutorState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : tutorState.error != null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 64,
                              color: Colors.grey.shade400,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              tutorState.error!,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => ref.read(tutorProvider.notifier).loadTutors(),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      )
                    : tutorState.tutors.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_off,
                                  size: 64,
                                  color: Colors.grey.shade400,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No tutors found',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Try adjusting your search criteria',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: () async {
                              _applyFilters();
                            },
                            child: ListView.builder(
                              padding: const EdgeInsets.all(16),
                              itemCount: tutorState.tutors.length,
                              itemBuilder: (context, index) {
                                final tutor = tutorState.tutors[index];
                                return Card(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.all(16),
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: Text(
                                        tutor.name.isNotEmpty ? tutor.name[0].toUpperCase() : 'T',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      tutor.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 4),
                                        Text(
                                          tutor.bio,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.grey.shade600),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 16,
                                              color: Colors.amber.shade600,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              tutor.rating.toStringAsFixed(1),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              '₺${tutor.hourlyRate.toInt()}/hour',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green.shade700,
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (tutor.subjects.isNotEmpty) ...[
                                          const SizedBox(height: 4),
                                          Wrap(
                                            spacing: 4,
                                            children: tutor.subjects.take(3).map(
                                              (subject) => Chip(
                                                label: Text(
                                                  subject.name,
                                                  style: const TextStyle(fontSize: 10),
                                                ),
                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                visualDensity: VisualDensity.compact,
                                              ),
                                            ).toList(),
                                          ),
                                        ],
                                      ],
                                    ),
                                    trailing: const Icon(Icons.arrow_forward_ios),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => TutorDetailScreen(tutorId: tutor.id),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
          ),
        ],
      ),
    );
  }
}