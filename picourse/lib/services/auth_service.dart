import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';
import '../models/auth_response.dart';
import 'api_client.dart';

class AuthService {
  final ApiClient _apiClient;
  
  AuthService(this._apiClient);
  
  Future<User> register(RegisterRequest request) async {
    final response = await _apiClient.register(request.toJson());
    return User.fromJson(response.data['user']);
  }
  
  Future<AuthResponse> login(LoginRequest request) async {
    final response = await _apiClient.login(request.toJson());
    final authResponse = AuthResponse.fromJson(response.data);
    await _apiClient.saveTokens(authResponse.access, authResponse.refresh);
    return authResponse;
  }
  
  Future<User> getProfile() async {
    final response = await _apiClient.getProfile();
    return User.fromJson(response.data);
  }
  
  Future<void> logout() async {
    await _apiClient.clearTokens();
  }
  
  Future<bool> isLoggedIn() async {
    return await _apiClient.hasValidToken();
  }
}
