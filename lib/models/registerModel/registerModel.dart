class UserModel {
  String? email;
  String? phone;
  String? name;
  String? uId;

  UserModel({
    this.uId,
    this.phone,
    this.name,
    this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'uId': uId,
    };
  }
}
