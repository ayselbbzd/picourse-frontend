// lib/screens/lessons/lesson_requests_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../providers/lesson_provider.dart';
import '../../providers/auth_provider.dart';
import '../../models/lesson_request.dart';

class LessonRequestsScreen extends ConsumerStatefulWidget {
  const LessonRequestsScreen({super.key});

  @override
  ConsumerState<LessonRequestsScreen> createState() =>
      _LessonRequestsScreenState();
}

class _LessonRequestsScreenState extends ConsumerState<LessonRequestsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadRequests();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _loadRequests() {
    final user = ref.read(authProvider).user;
    if (user != null) {
      ref.read(lessonProvider.notifier).loadLessonRequests(
        role: user.role,
        status: _selectedStatus,
      );
    }
  }

  void _onStatusFilterChanged(String? status) {
    setState(() {
      _selectedStatus = status;
    });
    _loadRequests();
  }

  Future<void> _updateRequestStatus(int id, String status) async {
    final success = await ref.read(lessonProvider.notifier)
        .updateLessonRequestStatus(id, status);
    
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Request ${status.toLowerCase()} successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final lessonState = ref.watch(lessonProvider);
    final authState = ref.watch(authProvider);
    final user = authState.user;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          user?.role == 'student' ? 'My Lesson Requests' : 'Lesson Requests',
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: _onStatusFilterChanged,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'pending',
                child: Text('Pending'),
              ),
              const PopupMenuItem(
                value: 'approved',
                child: Text('Approved'),
              ),
              const PopupMenuItem(
                value: 'rejected',
                child: Text('Rejected'),
              ),
            ],
          ),
        ],
      ),
      body: lessonState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : lessonState.error != null
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
                        lessonState.error!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadRequests,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : lessonState.lessonRequests.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.assignment_outlined,
                            size: 64,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No lesson requests found',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            user?.role == 'student'
                                ? 'Start by requesting a lesson from a tutor'
                                : 'Students will send you lesson requests',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () async => _loadRequests(),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: lessonState.lessonRequests.length,
                        itemBuilder: (context, index) {
                          final request = lessonState.lessonRequests[index];
                          return _LessonRequestCard(
                            request: request,
                            isStudentView: user?.role == 'student',
                            onStatusUpdate: _updateRequestStatus,
                          );
                        },
                      ),
                    ),
    );
  }
}

class _LessonRequestCard extends StatelessWidget {
  final LessonRequest request;
  final bool isStudentView;
  final Function(int, String) onStatusUpdate;

  const _LessonRequestCard({
    required this.request,
    required this.isStudentView,
    required this.onStatusUpdate,
  });

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'pending':
      default:
        return Colors.orange;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Icons.check_circle;
      case 'rejected':
        return Icons.cancel;
      case 'pending':
      default:
        return Icons.schedule;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with status
            Row(
              children: [
                Expanded(
                  child: Text(
                    isStudentView
                        ? 'Lesson with ${request.tutorName}'
                        : 'Lesson request from ${request.studentEmail}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(request.status).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getStatusIcon(request.status),
                        size: 16,
                        color: _getStatusColor(request.status),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        request.status.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: _getStatusColor(request.status),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // Subject and duration
            Row(
              children: [
                Icon(Icons.subject, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 8),
                Text(
                  request.subjectName,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Icon(Icons.schedule, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 4),
                Text('${request.durationMinutes} min'),
              ],
            ),
            const SizedBox(height: 8),
            
            // Date and time
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 8),
                Text(
                  DateFormat('MMM dd, yyyy - HH:mm').format(request.startTime),
                ),
              ],
            ),
            
            // Note if available
            if (request.note.isNotEmpty) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Note: ${request.note}',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
            
            // Action buttons for tutors
            if (!isStudentView && request.status == 'pending') ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => onStatusUpdate(request.id, 'rejected'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                      ),
                      child: const Text('Reject'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => onStatusUpdate(request.id, 'approved'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Approve'),
                    ),
                  ),
                ],
              ),
            ],
            
            // Created date
            const SizedBox(height: 8),
            Text(
              'Created: ${DateFormat('MMM dd, yyyy HH:mm').format(request.createdAt)}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}