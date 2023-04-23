import 'package:flutter/material.dart';
import 'package:lifeaste_lt/pages/advisor_list/logic.dart';
import 'package:lifeaste_lt/pages/advisor_list/state.dart';
import 'package:get/get.dart';

import '../../common/decoration.dart';
import '../../common/strings.dart';
import '../../models/advisormodel.dart';
import '../../widgets/loading.dart';

class AdvisorListPage extends StatelessWidget {
  final AdvisorListLogic logic = Get.put(AdvisorListLogic());
  final AdvisorListState state = Get.find<AdvisorListLogic>().state;

  AdvisorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<AdvisorListLogic>(
      id: state.advisorListGID,
      builder: (logic) {
        return Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 17,
              child: _mainContent(),
            ),
            Expanded(flex: 1, child: Container())
          ],
        );
      },
    );
  }

  Widget _mainContent() {
    if (state.advisorList.isNotEmpty) {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Strings.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: topBar(),
          body: _buildList(),
        ),
      );
    }
    return const Center(
      child: LoadingView(),
    );
  }

  AppBar topBar() {
    return AppBar(
      title: const Text(
        Strings.advisors,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      actions: [
        IconButton(onPressed: () {
          logic.jumpToExtensionPage();
        }, icon: const Icon(Icons.extension))
      ],
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: state.advisorList.length ~/ 2 + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return SizedBox(
              width: double.maxFinite,
              height: 50,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 13),
                    child: Image(
                      image: AssetImage("assets/2.0x/smallSquare.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "Trending",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ));
        } else {
          int index1 = ((index - 1) * 2) % 10;
          int index2 = ((index - 1) * 2 + 1) % 10;
          Advisor advisor1 = state.advisorList[index1];
          Advisor advisor2 = state.advisorList[index2];
          return SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      flex: 100,
                      child: advisorListCard(advisor1),
                    ),
                    Expanded(flex: 4, child: Container()),
                    Expanded(
                      flex: 100,
                      child: advisorListCard(advisor2),
                    )
                  ],
                ),
              ));
        }
      },
    );
  }

  Widget advisorListCard(Advisor advisor) {
    return Container(
      width: 200,
      height: 300,
      //设置圆角和边框
      decoration: MyDecoration.decoration1,
      child: Column(
        children: [
          avatar(advisor.avatar, advisor.liked),
          _name(advisor.name),
          _introduction(advisor.introduction),
          consultButton(advisor),
        ],
      ),
    );
  }

  /// 头像
  Widget avatar(String avatar, bool liked) {
    return Container(
      // 设置container圆角
      decoration: MyDecoration.decoration2,
      child: SizedBox(
          width: 200,
          height: 180,
          //使用clipRRect对image做包装防止image溢出container范围
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.zero,
                bottomLeft: Radius.zero,
                bottomRight: Radius.circular(15)),
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Image(
                      image: NetworkImage(avatar),
                      fit: BoxFit.fill,
                    )),
                Positioned(
                    bottom: 10,
                    right: 10,
                    child: Icon(
                      liked
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded,
                      size: 30,
                      color: Colors.pink,
                    )),
              ],
            ),
          )),
    );
  }

  /// 主页--名片--名字
  Container _name(String name) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return MyDecoration.gradient1.createShader(bounds);
        },
        blendMode: BlendMode.srcATop,
        child: Text(
          name,
          maxLines: 1,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  /// 主页--名片--简介
  Container _introduction(String introduction) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(12, 5, 30, 10),
      child: Text(
        introduction,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5,
          fontSize: 10,
        ),
      ),
    );
  }

  /// 主页--名片--咨询按钮
  Widget consultButton(Advisor advisor) {
    return SizedBox(
      width: double.maxFinite,
      height: 35,
      child: Center(
        child: Container(
          width: 140,
          decoration: BoxDecoration(
            gradient: MyDecoration.gradient1,
            border: Border.all(
              color: Colors.orange,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: TextButton(
            child: const Text(
              "Consult Now",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              //这里写按下consult按钮后执行的业务
              logic.jumpToAdvisorDetailPage(advisor);
            },
          ),
        ),
      ),
    );
  }
}
