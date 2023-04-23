import 'package:flutter/material.dart';
import 'package:lifeaste_lt/pages/advisor_detail/logic.dart';
import 'package:get/get.dart';
import 'package:lifeaste_lt/pages/advisor_detail/state.dart';

import '../../models/advisormodel.dart';

class AdvisorDetailPage extends StatelessWidget {
  final AdvisorDetailLogic logic = Get.put(AdvisorDetailLogic());
  final AdvisorDetailState state = Get.find<AdvisorDetailLogic>().state;

  AdvisorDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<AdvisorDetailLogic>(
        id: state.advisorDetailGID,
        builder: (logic) {
          return Flex(
            direction: Axis.vertical,
            children: [Expanded(child: mainContent())],
          );
        });
  }

  Widget mainContent() {
    return Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(0),
              children: [
                /// 除文本外区域
                Stack(
                  children: [
                    /// 顾问主页 -- 背景图
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Image(
                              image: AssetImage("assets/3.0x/bg3.png"),
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),

                    /// 顾问主页 -- 名片
                    AdvisorDetailCard(advisor: state.advisor),

                    /// 顾问主页 -- 头像
                    Positioned(
                      left: 50,
                      bottom: 180,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(state.advisor.avatar),
                        radius: 50,
                      ),
                    ),
                  ],
                ),

                /// 下方文本
                Column(
                  children: [
                    const SizedBox(
                      width: double.maxFinite,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
                        child: Text(
                          "About Me",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 20, 25, 30),
                        child: Text(
                          state.advisor.about,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
                top: 50,
                left: 10,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.keyboard_backspace,
                    size: 30,
                  ),
                ))
          ],
        ));
  }
}

class AdvisorDetailCard extends StatelessWidget {
  AdvisorDetailCard({super.key, required this.advisor});

  final Advisor advisor;

  final logic = Get.find<AdvisorDetailLogic>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
        left: 10,
        right: 10,
        bottom: 10,
        child: SizedBox(
          width: 350,
          height: 200,
          child: Card(
            //背景色
            color: Colors.white,
            //阴影色
            shadowColor: Colors.orange[500],
            //阴影距离
            elevation: 7,
            //设置圆角
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            //卡片内容
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              height: 200,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 收藏按钮
                  SizedBox(
                    width: 350,
                    height: 40,
                    child: Row(
                      children: [
                        const Padding(
                            padding: EdgeInsets.fromLTRB(300, 0, 0, 0)),
                        SizedBox(
                            width: 40,
                            height: 30,
                            child: GetBuilder<AdvisorDetailLogic>(
                                builder: (logic) {
                                  return IconButton(
                                    alignment: Alignment.center,
                                    onPressed: () {
                                      logic.reverseLikedState();
                                    },
                                    icon: Icon(
                                      logic.state.liked
                                          ? Icons.favorite_rounded
                                          : Icons.favorite_outline_rounded,
                                      color: Colors.pink,
                                      size: 30,
                                    ),
                                  );
                                }))
                      ],
                    ),
                  ),

                  /// 顾问主页 -- 名片 -- 名称
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: Text(
                      advisor.name,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),

                  /// 顾问主页 -- 名片 -- 简介
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
                    child: Text(
                      advisor.introduction,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),

                  /// 顾问主页 -- 名片 -- 内嵌卡片
                  Container(
                    width: 370,
                    height: 70,
                    alignment: Alignment.center,
                    child: Card(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              ///顾问主页 -- 名片 -- 内嵌卡片 -- 文本 Text Reading
                              Text(
                                'TextReading',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              ///顾问主页 -- 名片 -- 内嵌卡片 -- 文本 Delivered within 24h
                              Text(
                                "Delivered within 24h",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),

                          /// create order
                          ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.67),
                                ),
                              ),
                            ),
                            child: SizedBox(
                              width: 80,
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image(
                                      image: AssetImage("assets/3.0x/coin.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    "30",
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {
                              logic.toCreateOrderPage(advisor);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
