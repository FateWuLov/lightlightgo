import 'package:flutter/material.dart';

import 'adviser.dart';

class FMHomeVC extends StatefulWidget {
  const FMHomeVC({super.key});

  @override
  FMHomeState createState() => FMHomeState();
}

class FMHomeState extends State<FMHomeVC> {
  // 渐变效果设置
  Gradient gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Colors.orange.shade200,
        Colors.orange.shade500,
        Colors.orange.shade800
      ]);
  List consultant = [
    {
      'consultant1': [
        {'name': 'a'},
        {'sub': 'a.sub'},
        {'avatar': 'assets/images/photo01.png'}
      ],
      'consultant2': [
        {'name': 'b'},
        {'sub': 'b.sub'},
        {'avatar': 'assets/images/photo02.HEIC'}
      ],
    },
    {
      'consultant1': [
        {'name': 'a'},
        {'sub': 'a.sub'},
        {'avatar': 'assets/images/photo01.png'}
      ],
      'consultant2': [
        {'name': 'b'},
        {'sub': 'b.sub'},
        {'avatar': 'assets/images/photo02.HEIC'}
      ],
    },
    {
      'consultant1': [
        {'name': 'a'},
        {'sub': 'a.sub'},
        {'avatar': 'assets/images/photo01.png'}
      ],
      'consultant2': [
        {'name': 'b'},
        {'sub': 'b.sub'},
        {'avatar': 'assets/images/photo02.HEIC'}
      ],
    },
    {
      'consultant1': [
        {'name': 'a'},
        {'sub': 'a.sub'},
        {'avatar': 'assets/images/photo01.png'}
      ],
      'consultant2': [
        {'name': 'b'},
        {'sub': 'b.sub'},
        {'avatar': 'assets/images/photo02.HEIC'}
      ],
    },
    {
      'consultant1': [
        {'name': 'a'},
        {'sub': 'a.sub'},
        {'avatar': 'assets/images/photo01.png'}
      ],
      'consultant2': [
        {'name': 'b'},
        {'sub': 'b.sub'},
        {'avatar': 'assets/images/photo02.HEIC'}
      ],
    },
  ];

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
          return Container(
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
          return Container(
            height: 305,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.orange,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                myCard(index - 1, 'consultant1'),
                myCard(index - 1, 'consultant2'),
              ],
            ),
          );
        }
      },
    );
  }

  /// 主页--名片
  Widget myCard(int row, var column) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 200,
          height: 300,
          //设置圆角和边框
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            border: Border.all(
              color: Colors.orange,
              width: 2,
            ),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.zero,
                bottomLeft: Radius.zero,
                bottomRight: Radius.circular(15)),
          ),
          child: Column(
            children: [
              cardImage(row, column),
              titleText(row, column),
              subtitleText(row, column),
              consultButton(row, column),
            ],
          ),
        ),
        IconButton(
          onPressed: () {

          },
          icon: const Icon(
            Icons.favorite_outline_rounded,
            size: 30,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  /// 主页--名片--头像
  Widget cardImage(int row, var column) {
    ///contain主页的头像
    return Container(
      //设置container圆角
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.zero,
            bottomLeft: Radius.zero,
            bottomRight: Radius.circular(15)),
      ),
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
              image: AssetImage(consultant[row][column][2]['avatar']),
              fit: BoxFit.cover,
            ),
          )),
    );
  }

  /// 主页--名片--名字
  Container titleText(int row, var column) {
    return Container(
        width: double.maxFinite,
        // decoration: BoxDecoration(
        //   // border: Border.all(
        //   //   color: Colors.orange,
        //   //   width: 1,
        //   // ),
        // ),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return gradient.createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: Text(
            consultant[row][column][0]['name'],
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
  Container subtitleText(int row, var column) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(12, 5, 30, 10),
      child: Text(
        consultant[row][column][1]['sub'],
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
  Widget consultButton(int row, var column) {
    var title = consultant[row][column][0]['name'];
    var sub = consultant[row][column][1]['sub'];
    var avatar = consultant[row][column][2]['avatar'];
    return SizedBox(
      width: double.maxFinite,
      height: 35,
      child: Center(
        child: Container(
          width: 140,
          decoration: BoxDecoration(
            gradient: gradient,
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
                  title,
                  sub,
                  avatar,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
