// lib/providers/auth_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../models/auth_response.dart';
import '../services/auth_service.dart';
import 'providers.dart';

class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.error,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    User? user,
    bool? isLoading,
    String? error,
    bool? isAuthenticated,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(const AuthState()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    try {
      if (await _authService.isLoggedIn()) {
        final user = await _authService.getProfile();
        state = state.copyWith(user: user, isAuthenticated: true);
      }
    } catch (e) {
      await _authService.logout();
      state = state.copyWith(isAuthenticated: false);
    }
  }

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final loginRequest = LoginRequest(email: email, password: password);
      await _authService.login(loginRequest);
      final user = await _authService.getProfile();
      
      state = state.copyWith(
        user: user,
        isLoading: false,
        isAuthenticated: true,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
      return false;
    }
  }

  Future<bool> register({
    required String email,
    required String password,
    required String passwordConfirm,
    required String role,
    required String firstName,
    required String lastName,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final registerRequest = RegisterRequest(
        email: email,
        password: password,
        passwordConfirm: passwordConfirm,
        role: role,
        firstName: firstName,
        lastName: lastName,
      );
      
      final user = await _authService.register(registerRequest);
      
      state = state.copyWith(
        user: user,
        isLoading: false,
        isAuthenticated: true,
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getErrorMessage(e),
      );
      return false;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    state = const AuthState();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  String _getErrorMessage(dynamic error) {
    if (error.toString().contains('Invalid credentials')) {
      return 'Invalid email or password';
    }
    if (error.toString().contains('email')) {
      return 'Invalid email format';
    }
    if (error.toString().contains('password')) {
      return 'Password requirements not met';
    }
    return 'An error occurred. Please try again.';
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read(authServiceProvider));
});