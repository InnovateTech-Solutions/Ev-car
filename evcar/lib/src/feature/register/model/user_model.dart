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

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'username': username,
      'carType': carType,
      'password': password,
      'role': 'user',
    };
  }
}
