import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/advisormodel.dart';
import '../../models/ordermodel.dart';
import 'logic.dart';

class OrderListPage extends StatelessWidget {
  OrderListPage({super.key});

  final logic = Get.put(OrderListLogic());
  final state = Get.find<OrderListLogic>().state;

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
      body: _body(),
    );
  }

  Widget _body() {
    return GetBuilder<OrderListLogic>(builder: (logic) {
      int amount = state.list?.length as int;
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
            Order order = state.list![amount - 1 - index];
            Advisor advisor = order.advisor;
            int year = order.date.year;
            int month = order.date.month;
            int day = order.date.day;
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                elevation: 0,
                color: Colors.orange.shade100,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 15, 5),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(advisor.avatar),
                            radius: 20,
                          ),
                        ),
                        Text(
                          advisor.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
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
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              "Text Reading",
                              // advisor.services[0].name as String,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                          child: SizedBox(
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
    });
  }
}
