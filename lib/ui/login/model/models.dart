class Users {
  String? address;
  int? id;
  String? email;
  String? username;
  String? password;
  String? name;
  String? phone;
  int? iV;
  String? token;

  Users(
      {this.address,
      this.id,
      this.email,
      this.username,
      this.password,
      this.name,
      this.phone,
      this.iV,
      this.token});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      address: json["address"] ?? "",
      id: json["id"] ?? 0,
      email: json["email"] ?? "",
      username: json["username"] ?? "",
      password: json["password"] ?? "",
      name: json["name"] ?? "",
      phone: json["phone"] ?? "",
      iV: json["iV"] ?? 0,
      token: json['token'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "address": address,
      "id": id,
      "email": email,
      "username": username,
      "password": password,
      "name": name,
      "phone": phone,
      "iV": iV,
      "token": token,
    };
  }

//
//
}
