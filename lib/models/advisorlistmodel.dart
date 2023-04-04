/// 主页顾问列表model

class AdvisorListModel {
  static List<String> advisorNames = [
    'Rose',
    'Emily',
    'Lindy',
    'Cindy',
    'Mike',
    'Carl',
    'Andy',
    'Paul',
    'Queen',
    'King'
 ];
  static List<String> advisorIntroduction = [
    'Rose introduction',
    'Emily introduction',
    'Lindy introduction',
    'Cindy introduction',
    'Mike introduction',
    'Carl introduction',
    'Andy introduction',
    'Paul introduction',
    'Queen introduction',
    'King introduction'
  ];
  static List<String> advisorAbout = [
    'Rose b',
    'Emily b',
    'Lindy b',
    'Cindy b',
    'Mike b',
    'Carl b',
    'Andy b',
    'Paul b',
    'Queen b',
    'King b'
  ];
  static List<String> advisorAvatar = [
    "assets/images/photo03.jpg",
    "assets/images/photo04.jpg",
    "assets/images/photo05.jpg",
    "assets/images/photo06.jpg",
    "assets/images/photo07.jpg",
    "assets/images/photo08.jpg",
    "assets/images/photo09.jpg",
    "assets/images/photo10.jpg",
    "assets/images/photo01.png",
    "assets/images/photo02.HEIC",
  ];

  Advisor getById(int id) => Advisor(id, advisorNames[id % advisorNames.length], advisorIntroduction[id % advisorIntroduction.length], advisorAbout[id % advisorAbout.length], advisorAvatar[id % advisorAvatar.length]);

  Advisor getByName(String name) {
    return getById(advisorNames.indexOf(name));
  }
}

class Advisor {
  final int id;
  final String name;
  final String avatar;
  final String introduction;
  final String about;
  late final bool liked;

  Advisor(this.id, this.name, this.introduction, this.about, this.avatar);

  @override
  // TODO: implement hashCode
  int get hashCode => id;

  @override
  bool operator == (Object other) => other is Advisor && other.id == id;
}