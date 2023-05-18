class UserInfo {
  int? id;
  String? email;
  String? password;

  UserInfo({this.id, this.email, this.password});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;

    return data;
  }
}
