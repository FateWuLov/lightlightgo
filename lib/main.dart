import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/models/advisormodel.dart';
import 'package:myapp/pages/edit.dart';
import 'package:myapp/pages/user.dart';
import 'models/advisormodel.dart';
import 'pages/advisor.dart';
import 'pages/home.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox("userBox");
  await Hive.openBox("advisorBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initBox();
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: "/",
        routes: {
          "/": (context) => const FMHomeVC(),
          "advisor": (context) => const FMAdvisorVC(),
          "user": (context) => const FMUserVC(),
          "edit": (context) => const FMEditVC(),
          //=> const FMAdvisorVC(),
        },
    );
  }
  initBox () {
    Box box1 = Hive.box("userBox");
    if (box1.isEmpty) {initUserBox(box1);}
    Box box2 = Hive.box("advisorBox");
    if (box2.isEmpty) {initAdvisorBox(box2);}
  }
  initUserBox (Box box) {
    box.put("name", "default");
    box.put("bio", "default");
    box.put("gender", "default");
    box.put("birth", DateTime(1999,9,9));
    box.put("about", "default");
    box.put("avatar", "assets/3.0x/defaultAvatar.png");
    box.put("likedList", []);
  }
  initAdvisorBox (Box box) {
    final advisorNames = [
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
    final advisorIntroduction = [
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
    final advisorAbout = [
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
    final advisorAvatar = [
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
    int i = 0;
    while (i < advisorNames.length) {
      box.add(Advisor(advisorNames[i], advisorIntroduction[i], advisorAbout[i], advisorAvatar[i]));
      i++;
    }
  }
}
