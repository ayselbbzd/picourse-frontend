// lib/screens/tutors/tutor_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/tutor_provider.dart';
import '../../providers/auth_provider.dart';
import '../lessons/create_lesson_request_screen.dart';

class TutorDetailScreen extends ConsumerStatefulWidget {
  final int tutorId;

  const TutorDetailScreen({
    super.key,
    required this.tutorId,
  });

  @override
  ConsumerState<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends ConsumerState<TutorDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(tutorProvider.notifier).loadTutorDetail(widget.tutorId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tutorState = ref.watch(tutorProvider);
    final authState = ref.watch(authProvider);
    final tutor = tutorState.selectedTutor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutor Details'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: tutorState.isLoading
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
                        onPressed: () {
                          ref.read(tutorProvider.notifier).loadTutorDetail(widget.tutorId);
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : tutor == null
                  ? const Center(child: Text('Tutor not found'))
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Tutor Header
                          Center(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.blue,
                                  child: Text(
                                    tutor.name.isNotEmpty ? tutor.name[0].toUpperCase() : 'T',
                                    style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  tutor.name,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber.shade600,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      tutor.rating.toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Text(
                                      '₺${tutor.hourlyRate.toInt()}/hour',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          
                          // Bio Section
                          const Text(
                            'About',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              tutor.bio.isNotEmpty ? tutor.bio : 'No bio available.',
                              style: const TextStyle(
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          
                          // Subjects Section
                          const Text(
                            'Subjects',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (tutor.subjects.isNotEmpty)
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: tutor.subjects.map(
                                (subject) => Chip(
                                  label: Text(subject.name),
                                  backgroundColor: Colors.blue.shade50,
                                  side: BorderSide(color: Colors.blue.shade200),
                                ),
                              ).toList(),
                            )
                          else
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text('No subjects listed.'),
                            ),
                          const SizedBox(height: 32),
                          
                          // Request Lesson Button (only for students)
                          if (authState.user?.role == 'student')
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => CreateLessonRequestScreen(tutor: tutor),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Request Lesson',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
    );
  }
}