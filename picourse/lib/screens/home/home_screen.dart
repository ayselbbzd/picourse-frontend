// lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider.dart';
import '../tutors/tutors_list_screen.dart';
import '../lessons/lesson_requests_screen.dart';
import '../auth/login_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

    if (!authState.isAuthenticated) {
      return const LoginScreen();
    }

    final pages = [
      const TutorListScreen(),
      const LessonRequestsScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Find Tutors',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.assignment),
            label: user?.role == 'student' ? 'My Requests' : 'Requests',
          ),
        ],
      ),
    );
  }
}
