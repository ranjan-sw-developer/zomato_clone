class AuthResponse {
  final String token;
  final UserModel user;

  AuthResponse({required this.token, required this.user});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      user: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'token': token, 'user': user.toJson()};
  }
}

class UserModel {
  final String id;
  final String name;
  final String role;

  UserModel({required this.id, required this.name, required this.role});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], name: json['name'], role: json['role']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'role': role};
  }
}
