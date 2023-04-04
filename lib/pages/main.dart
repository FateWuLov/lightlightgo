import 'package:flutter/material.dart';
import 'package:myapp/models/advisorlistmodel.dart';
import 'package:myapp/models/advisormodel.dart';
import 'package:provider/provider.dart';
import 'adviser.dart';
import 'home.dart';

/// cartlog -- advisorlist; cart -- likedlist; item -- advisor
/// cartlogmodel -- advisorlistmodel; cartmodel -- advisormodel

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => AdvisorListModel()),
        ChangeNotifierProxyProvider<AdvisorListModel, AdvisorModel>(
          create: (context) => AdvisorModel(),
          update: (context, advisorList, likedList){
            if (likedList == null) throw ArgumentError.notNull('likedList');
            likedList.advisorList = advisorList;
            return likedList;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: "/",
        routes: {
          "/": (context) => const FMHomeVC(),
          "advisor": (context) {
            return const FMAdvisorVC();
          }
          //=> const FMAdvisorVC(),
        },
      )
    );
  }
}
