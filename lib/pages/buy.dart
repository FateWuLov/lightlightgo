import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/dbutil.dart';
import '../common/util.dart';
import '../models/advisormodel.dart';
import '../models/ordermodel.dart';
import '../models/usermodel.dart';

Order order = Order(Advisor("", "", "", "", false, []), '', '');

class FMBuyVC extends StatefulWidget {
  const FMBuyVC({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FMBuyVCState();
  }
}

class FMBuyVCState extends State<FMBuyVC> {
  @override
  Widget build(BuildContext context) {
    /// 获取屏幕大小
    final size = MediaQuery.of(context).size;
    final width = size.width;

    /// 获取传参
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    int index = args.index;
    DBUtil dbUtil = DBUtil.instance;
    Advisor advisor = dbUtil.advisorBox.getAt(index);
    User user = dbUtil.userBox.getAt(0);
    //Order order = Order(advisor, '', '');
    order.advisor = advisor;
    ValueNotifier<Order> orderNotifier = ValueNotifier<Order>(order);
    double bottom = MediaQuery.of(context).viewInsets.bottom;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Counseling Form",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange.shade100,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            showDialog(
              context: context,
              barrierColor: Colors.transparent, //设置透明底色,自定义也可能会用到
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("测试：真的要退出吗"),
                  content: const Text("测试内容"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Text('确认'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('取消'),
                    ),
                  ],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                );
              },
            );
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: CircleAvatar(
                            backgroundImage: AssetImage(advisor.avatar),
                            radius: 30),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          advisor.name,
                          style: const TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: const Text("Name",
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(user.name,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500)),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      height: 0.2,
                      color: Colors.black,
                    )),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
                  child: const Text("General Situation",
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText:
                      "Describe your situation in certain sentences to help your advisor know better your status to further improve the quality of service",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      border: const OutlineInputBorder(
                        gapPadding: 0,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onChanged: (text) {
                      order.situation = text;
                      print(order.situation);
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: const Text("Specific Question",
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: "One question only",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onChanged: (text) {
                      order.question = text;
                      print(order.question);
                    },
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: bottom > 0 ? 100.0 * -1 : 38.0,
                child: SizedBox(
                  width: width,
                  child: Center(
                    child: SizedBox(
                        width: 380,
                        height: 70,
                        child: ValueListenableBuilder(
                          /// 设置监听，监听自定义的order实体，两个空都填了的话按钮就变成可用状态
                          valueListenable: orderNotifier,
                          builder: (context, Order value, _) {
                            ///
                            /// issue：设置了一个valueNotifier监听自定义order对象的值，输入时会改变order的属性值(onChanged(){ })，
                            /// 通过print也能确定order的值确实已经被改变，但是获取了notifier的按钮(通过ValueListenableBuilder构建)却无法监听到值改变，一直是灰度
                            ///
                            return MaterialButton(
                              disabledColor: Colors.grey,
                              color: Colors.lightBlueAccent,
                              /// 设置圆角
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(30)),
                              ),
                              onPressed:
                              (value.question.isEmpty || value.situation.isEmpty)
                                  ? null
                                  : () {
                                //dbUtil.orderBox.clear();
                                value.date = DateTime.now();
                                dbUtil.orderBox.add(value);
                                Navigator.pop(context);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                  const Padding(padding: EdgeInsets.all(3)),
                                  SizedBox(
                                    height: 20,
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Image(
                                          image:
                                          AssetImage("assets/3.0x/coin.png"),
                                          fit: BoxFit.fill,
                                        ),
                                        Padding(padding: EdgeInsets.all(5)),
                                        Text(
                                          "30",
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        )),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
