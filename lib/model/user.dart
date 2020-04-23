class User {
  String phone;
  String name;
  int age;

  User({this.phone, this.name, this.age});

  User.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['age'] = this.age;
    return data;
  }
}
