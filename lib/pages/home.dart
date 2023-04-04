import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/models/advisorlistmodel.dart';
import 'package:provider/provider.dart';

import '../common/decoration.dart';
import 'adviser.dart';

class FMHomeVC extends StatefulWidget {
  const FMHomeVC({super.key});

  @override
  FMHomeState createState() {return FMHomeState();}
}

class FMHomeState extends State<FMHomeVC> {
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
        body: homePageBody(),
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
    );
  }

  ///主页--listview
  ListView homePageBody() {
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
          return SizedBox(
            height: 305,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AdvisorCard(id: (index-1)*2),
                AdvisorCard(id: (index-1)*2+1),
              ],
            ),
          );
        }
      },
    );
  }
}

/// 名片
class AdvisorCard extends StatelessWidget {
  //final Advisor advisor;
  final int id;
  const AdvisorCard({super.key, required this.id});
  @override
  Widget build(BuildContext context) {

    var advisor = context.select<AdvisorListModel, Advisor> ((advisorList) => advisorList.getById(id));

    if (kDebugMode) {
      print("print : advisor --> $advisor");
    }

    // TODO: implement build
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 200,
          height: 300,
          //设置圆角和边框
          decoration: MyDecoration.decoration1,
          child: Column(
            children: [
              avatar(advisor.avatar),
              _name(advisor.name),
              _introduction(advisor.introduction),
              ConsultButton(id: id),
            ],
          ),
        ),
        /// 收藏按钮
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_outline_rounded,
            size: 30,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
  /// 头像
  Widget avatar(String avatar) {
    if (kDebugMode) {
      print("print avatar :$avatar success");
    }
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
            child: Image(
              image: AssetImage(avatar),
              fit: BoxFit.cover,
            ),
          )),
    );
  }

  /// 主页--名片--名字
  Container _name(String name) {
    if (kDebugMode) {
      print("name: $name");
    }
    return Container(
        width: double.maxFinite,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return MyDecoration.gradient.createShader(bounds);
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
        ));
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
class ConsultButton extends StatelessWidget{
  final int id;
  const ConsultButton({super.key, required this.id});

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
            gradient: MyDecoration.gradient,
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
                arguments: ScreenArguments(
                  id
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
