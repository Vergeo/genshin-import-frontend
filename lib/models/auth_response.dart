// auth_response.dart

class AuthResponse {
  final int userId;
  final String username;
  final String fullName;
  final String role;
  final String accessToken;

  AuthResponse({
    required this.userId,
    required this.username,
    required this.fullName,
    required this.role,
    required this.accessToken,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      userId: json['user_id'],
      username: json['username'],
      fullName: json['full_name'],
      role: json['role'],
      accessToken: json['accessToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'username': username,
      'full_name': fullName,
      'role': role,
      'accessToken': accessToken,
    };
  }
}
