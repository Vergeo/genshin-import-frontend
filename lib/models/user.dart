// user.dart

class User {
  final int userId;
  final String username;
  final String fullName;
  final String role;

  User({
    required this.userId,
    required this.username,
    required this.fullName,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      username: json['username'],
      fullName: json['full_name'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'username': username,
      'full_name': fullName,
      'role': role,
    };
  }

  static List<User> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => User.fromJson(json)).toList();
  }
}
