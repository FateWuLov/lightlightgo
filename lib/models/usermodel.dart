class User {
  final String name;
  final String bio;
  late final String gender;
  late final DateTime birth;
  late final String about;
  final String avatar;
  final List<int> likedList;
  User(this.name, this.bio, this.gender, this.birth, this.about, this.avatar, this.likedList);
}