
class UserPost {
  int? id;
  String? name;
  String? age;
  String? address;

  UserPost({this.id, this.name, this.age, this.address});

  UserPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['address'] = this.address;
    return data;
  }
}