class User {
  String id;
  String belong;
  String belongType;
  String md;
  String name;
  String idCard;
  String mobile;
  String createTime;
  String password;

  User(
      {this.id,
      this.belong,
      this.belongType,
      this.md,
      this.name,
      this.idCard,
      this.mobile,
      this.createTime,
      this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    belong = json['belong'];
    belongType = json['belongType'];
    md = json['md'];
    name = json['name'];
    idCard = json['idCard'];
    mobile = json['mobile'];
    createTime = json['createTime'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['belong'] = this.belong;
    data['belongType'] = this.belongType;
    data['md'] = this.md;
    data['name'] = this.name;
    data['idCard'] = this.idCard;
    data['mobile'] = this.mobile;
    data['createTime'] = this.createTime;
    data['password'] = this.password;
    return data;
  }
}
