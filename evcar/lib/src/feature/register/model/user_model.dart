class UserModel {
  String phone;
  String username;
  String carType;
  String password;
  String? role;

  UserModel(
      {required this.phone,
      required this.username,
      required this.carType,
      required this.password,
      this.role});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      phone: json['phone'] ?? '',
      username: json['username'] ?? '',
      carType: json['carType'] ?? '',
      password: json['password'] ?? '',
      role: json['role'],
    );
  }

  toJson() {
    return {
      'phone': phone,
      'username': username,
      'carType': carType,
      'password': password,
      'role': 'user',
    };
  }
}
