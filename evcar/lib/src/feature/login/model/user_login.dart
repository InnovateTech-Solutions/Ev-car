class UserLogin {
  late String phone;
  late String password;

  UserLogin({required this.phone, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
    };
  }
}
