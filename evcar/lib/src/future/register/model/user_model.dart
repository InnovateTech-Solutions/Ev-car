class UserModel {
  String phone;
  String? username;
  String? carType;
  String password;
  String? role;

  UserModel(
      {required this.phone,
      this.username,
      this.carType,
      required this.password,
      this.role});

  toJson() {
    return {
      'email': phone,
      'username': username,
      'carType': carType,
      'password': password,
      'role': role,
    };
  }
}
