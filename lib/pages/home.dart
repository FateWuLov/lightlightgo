import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/models/advisormodel.dart';

import '../common/dbutil.dart';
import '../common/decoration.dart';
import '../common/util.dart';

const String advisorBoxName = "advisorBox";
const String userBoxName = "userBox";

class FMHomeVC extends StatefulWidget {
  const FMHomeVC({super.key});

  @override
  FMHomeState createState() {
    return FMHomeState();
  }
}

class FMHomeState extends State<FMHomeVC> {
  DBUtil dbUtil = DBUtil.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // TODO: implement build
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: myAppBar(),
        body: _buildListView(),
      ),
    );
  }

  /// 主页--appBar
  AppBar myAppBar() {
    return AppBar(
      title: const Text(
        'Advisors',
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
        /// 个人用户
        /*ValueListenableBuilder(
          valueListenable: dbUtil.userBox.listenable(),
          builder: (context, Box box, _) {
            return TextButton(
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  'user',
                );
              },
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: MyDecoration.borderRadius,
                    color: Colors.white
                ),
                alignment: Alignment.center,
                child: Text(
                  box.name
                ),
              ),
            );
          },),*/
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "test");
            },
            icon: Icon(Icons.telegram)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "extension");
            },
            icon: Icon(Icons.extension_outlined)),
      ],
    );
  }

  ///主页--listview
  Widget _buildListView() {
    return ValueListenableBuilder(
      valueListenable: dbUtil.advisorBox.listenable(),
      builder: (context, Box box, _) {
        return ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            //添加listview的表头
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
            }

            ///list的每一行都是一个container，这个container中又包含两个名片container
            else {
              int index1 = ((index - 1) * 2) % 10;
              int index2 = ((index - 1) * 2 + 1) % 10;
              return SizedBox(
                height: 300,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 100,
                        child: AdvisorCard(
                          index: index1,
                        ),
                      ),
                      Expanded(flex: 4, child: Container()),
                      Expanded(
                        flex: 100,
                        child: AdvisorCard(
                          index: index2,
                        ),
                      )
                    ],
                  ),
                )
              );
            }
          },
        );
      },
    );
  }
}

/// 名片
class AdvisorCard extends StatelessWidget {
  final int index;
  const AdvisorCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    DBUtil dbUtil = DBUtil.instance;
    Advisor advisor = dbUtil.advisorBox.getAt(index);
    // TODO: implement build
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
              ConsultButton(
                index: index,
              ),
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
                    liked == true
                        ? Icons.favorite_rounded
                        : Icons.favorite_outline_rounded,
                    size: 30,
                    color: Colors.pink,
                  ),
                ),
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
}

/// 主页--名片--咨询按钮
class ConsultButton extends StatelessWidget {
  final int index;

  const ConsultButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              Navigator.pushNamed(
                context,
                'advisor',
                arguments: ScreenArguments(index),
              );
            },
          ),
        ),
      ),
    );
  }
}
