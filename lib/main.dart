import 'package:flutter/material.dart';
import 'package:myapp/pages/buy.dart';
import 'package:myapp/pages/edit.dart';
import 'package:myapp/pages/extension1.dart';
import 'package:myapp/pages/tabhelper.dart';
import 'package:myapp/pages/test.dart';
import 'package:myapp/pages/user.dart';
import 'common/dbutil.dart';
import 'pages/advisor.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBUtil.install();
  await DBUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/": (context) => const TabHelper(),
        "advisor": (context) => const FMAdvisorVC(),
        "user": (context) => const FMUserVC(),
        "edit": (context) => const FMEditVC(),
        "buy" : (context) => const FMBuyVC(),
        "test": (context) => const TestPage(),
        "extension": (context) => const FMExtensionVC()
      },
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
