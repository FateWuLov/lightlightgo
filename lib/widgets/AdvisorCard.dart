import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/decoration.dart';
import '../models/advisormodel.dart';

class AdvisorCard extends StatelessWidget {
  final Advisor advisor;

  const AdvisorCard({super.key, required this.advisor});

  @override
  Widget build(BuildContext context) {
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

            },
          ),
        ),
      ),
    );
  }
}