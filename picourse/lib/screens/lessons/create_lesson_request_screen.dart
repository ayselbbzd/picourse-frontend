// lib/screens/lessons/create_lesson_request_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../providers/lesson_provider.dart';
import '../../providers/tutor_provider.dart';
import '../../providers/auth_provider.dart';
import '../../models/tutor.dart';
import '../../models/subject.dart';
import '../../models/lesson_request.dart';

class CreateLessonRequestScreen extends ConsumerStatefulWidget {
  final Tutor tutor;

  const CreateLessonRequestScreen({
    super.key,
    required this.tutor,
  });

  @override
  ConsumerState<CreateLessonRequestScreen> createState() =>
      _CreateLessonRequestScreenState();
}

class _CreateLessonRequestScreenState
    extends ConsumerState<CreateLessonRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _noteController = TextEditingController();
  
  Subject? _selectedSubject;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  int _selectedDuration = 60;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  Future<void> _selectTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 10, minute: 0),
    );
    
    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

  Future<void> _createRequest() async {
    if (!_formKey.currentState!.validate() || 
        _selectedSubject == null || 
        _selectedDate == null || 
        _selectedTime == null) {
      return;
    }

    final startTime = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    final success = await ref.read(lessonProvider.notifier).createLessonRequest(
      tutorId: widget.tutor.id,
      subjectId: _selectedSubject!.id,
      startTime: startTime,
      durationMinutes: _selectedDuration,
      note: _noteController.text.trim(),
    );

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lesson request sent successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final lessonState = ref.watch(lessonProvider);
    final tutorState = ref.watch(tutorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Lesson'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tutor Info
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        widget.tutor.name[0].toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.tutor.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₺${widget.tutor.hourlyRate.toInt()}/hour',
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // Subject Selection
              const Text(
                'Subject',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<Subject>(
                value: _selectedSubject,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Select a subject',
                ),
                items: widget.tutor.subjects.map(
                  (subject) => DropdownMenuItem(
                    value: subject,
                    child: Text(subject.name),
                  ),
                ).toList(),
                onChanged: (subject) {
                  setState(() {
                    _selectedSubject = subject;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a subject';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              
              // Date Selection
              const Text(
                'Date',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: _selectDate,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 12),
                      Text(
                        _selectedDate != null
                            ? DateFormat('EEEE, MMMM d, y').format(_selectedDate!)
                            : 'Select a date',
                        style: TextStyle(
                          fontSize: 16,
                          color: _selectedDate != null ? Colors.black : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Time Selection
              const Text(
                'Time',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: _selectTime,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.access_time),
                      const SizedBox(width: 12),
                      Text(
                        _selectedTime != null
                            ? _selectedTime!.format(context)
                            : 'Select a time',
                        style: TextStyle(
                          fontSize: 16,
                          color: _selectedTime != null ? Colors.black : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Duration Selection
              const Text(
                'Duration',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<int>(
                value: _selectedDuration,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 30, child: Text('30 minutes')),
                  DropdownMenuItem(value: 60, child: Text('1 hour')),
                  DropdownMenuItem(value: 90, child: Text('1.5 hours')),
                  DropdownMenuItem(value: 120, child: Text('2 hours')),
                ],
                onChanged: (duration) {
                  setState(() {
                    _selectedDuration = duration!;
                  });
                },
              ),
              const SizedBox(height: 24),
              
              // Notes
              const Text(
                'Notes (Optional)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _noteController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add any specific requests or topics you want to focus on...',
                ),
              ),
              const SizedBox(height: 32),
              
              // Error message
              if (lessonState.error != null) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    border: Border.all(color: Colors.red.shade200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    lessonState.error!,
                    style: TextStyle(color: Colors.red.shade700),
                  ),
                ),
                const SizedBox(height: 16),
              ],
              
              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: lessonState.isLoading ? null : _createRequest,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: lessonState.isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Send Request',
                          style: TextStyle(fontSize: 16),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// lib/screens/lessons/lesson_requests_screen.dart

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
                value: null,
                child: Text('All Status'),
              ),
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