class User {
  String name;
  String introduction;
  String avatar;
  bool status;


  User(this.name, this.introduction, this.avatar, this.status);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        introduction = json['introduction'],
        avatar = json['avatar'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'introduction': introduction,
    'avatar': avatar,
    'status': status,
  };
}