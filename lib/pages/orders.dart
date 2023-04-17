import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/common/dbutil.dart';

import '../common/util.dart';
import '../models/advisormodel.dart';
import '../models/ordermodel.dart';
import '../models/usermodel.dart';

class FMOrderVC extends StatefulWidget {
  const FMOrderVC({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FMOrderVCState();
  }
}

class FMOrderVCState extends State<FMOrderVC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Order",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange.shade100,
        elevation: 0,
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BodyState();
  }
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ValueListenableBuilder(
      valueListenable: DBUtil.instance.orderBox.listenable(),
      builder: (context, Box box, _) {
        int amount = box.length;
        List orderList = [];
        for (int i = 0; i < amount; i++) {
          orderList.add(box.getAt(i));
        }
        if (amount == 0) {
          return const Center(
            child: Text(
              "No order",
              style: TextStyle(
                  fontSize: 30, wordSpacing: 0.5, fontWeight: FontWeight.w600),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: amount,
            itemBuilder: (BuildContext context, int index) {
              Order order = orderList[amount - 1 - index];
              Advisor advisor = order.advisor;
              int year = order.date.year;
              int month = order.date.month;
              int day = order.date.day;
              return Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)),),
                  elevation: 0,
                  color: Colors.orange.shade100,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 5, 15, 5),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(advisor.avatar),
                              radius: 20,
                            ),
                          ),
                          Text(
                            advisor.name,
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                        ],
                      ),
                      Container(
                        width: 350,
                        color: Colors.brown,
                        height: 0.1,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                            child: Container(
                              width: double.maxFinite,
                              child: Text(
                                "Text Reading",
                                // advisor.services[0].name as String,
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                            child: Container(
                              width: double.maxFinite,
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Text(order.question),
                                  Positioned(
                                    right: 10,
                                    bottom: 0,
                                    child: Text("$month $day,$year"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
