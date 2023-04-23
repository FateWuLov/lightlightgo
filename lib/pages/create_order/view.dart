import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste_lt/manager/hiveManager.dart';
import 'package:lifeaste_lt/pages/create_order/logic.dart';

import '../../models/ordermodel.dart';

class CreateOrderPage extends StatelessWidget {
  CreateOrderPage({super.key});

  final logic = Get.put(CreateOrderLogic());
  final state = Get.find<CreateOrderLogic>().state;

  @override
  Widget build(BuildContext context) {
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
                            backgroundImage: NetworkImage(state.advisor.avatar),
                            radius: 30),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          state.advisor.name,
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
                  child: Text(
                      state.user.name,
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
                    controller: state.myController1,
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
                    controller: state.myController2,
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
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: bottom > 0 ? 100.0 * -1 : 38.0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: SizedBox(
                        width: 380,
                        height: 70,
                        child: MaterialButton(
                          disabledColor: Colors.grey,
                          color: Colors.lightBlueAccent,
                          /// 设置圆角
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30)),
                          ),
                          onPressed:
                          (state.myController1.value.text.isEmpty || state.myController2.value.text.isEmpty)
                              ? null
                              : () {
                            logic.createOrder();
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
                        )
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}