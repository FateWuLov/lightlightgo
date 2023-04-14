import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myapp/models/advisormodel.dart';
import '../common/dbutil.dart';
import '../common/decoration.dart';
import '../common/util.dart';
import '../models/usermodel.dart';

class FMExtensionVC extends StatefulWidget {
  const FMExtensionVC({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FMExtensionVCState();
  }
}

class FMExtensionVCState extends State<FMExtensionVC> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      appBar: ExtensionAppBar(),
      backgroundColor: Colors.white,
      body: ExtensionBody(),
    );
  }
}

class ExtensionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ExtensionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: ShaderMask(
        shaderCallback: (Rect bounds) {
          return MyDecoration.gradient2.createShader(bounds);
        },
        child: const Text(
          "Soulight",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
      ),
      centerTitle: false,
      actions: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return MyDecoration.gradient2.createShader(bounds);
          },
          child: IconButton(onPressed: () {}, icon: Icon(Icons.search_sharp)),
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return MyDecoration.gradient2.createShader(bounds);
          },
          child: IconButton(
              onPressed: () {}, icon: Icon(Icons.change_circle_outlined)),
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return MyDecoration.gradient2.createShader(bounds);
          },
          child: IconButton(onPressed: () {}, icon: Icon(Icons.trip_origin)),
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(40);
}

class ExtensionBody extends StatefulWidget {
  const ExtensionBody({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ExtensionBodyState();
  }
}

class ExtensionBodyState extends State<ExtensionBody> {
  @override
  Widget build(BuildContext context) {
    Box box = DBUtil.instance.advisorBox;
    List<Advisor> advisorList = [];
    for (int i = 0; i < box.length; i++) {
      advisorList.add(box.getAt(i));
    }
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [

            /// bonus 提示，同时也是按钮
            LayoutBuilder(builder: (context, constraints) {
              final width = constraints.maxWidth;
              return SizedBox(
                width: width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      foregroundColor: Colors.purple,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: Colors.purple),
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.purple.shade50,
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 1, child: Icon(Icons.add)),
                        Expanded(
                            flex: 12,
                            child: Container(
                              height: 20,
                              alignment: Alignment.center,
                              child:
                                  Text("Check in everyday to get free bonus."),
                            )),
                        Expanded(flex: 1, child: Icon(Icons.abc))
                      ],
                    ),
                  ),
                ),
              );
            }),

            /// 上方大卡片
            LayoutBuilder(builder: (context, constraints) {
              final width = constraints.maxWidth;
              Advisor advisor = advisorList[0];
              return SizedBox(
                width: width,
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      left: 0,
                      top: 0,
                      bottom: 20,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        color: Colors.black,
                        child: Stack(
                          children: [
                            Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Image(
                              image: AssetImage(advisor.avatar),
                                fit: BoxFit.cover
                            )),
                            Positioned(
                                top: 5,
                                right: 5,
                                child: Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.purple),
                                    Icon(Icons.star, color: Colors.purple),
                                    Icon(Icons.star, color: Colors.purple),
                                    Icon(Icons.star, color: Colors.purple)
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Top Accuracy",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.yellow.shade400,
                                minimumSize: Size.zero,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(advisor.avatar),
                                    radius: 25,
                                  ),
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child:
                                                Text(advisor.name,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.purple))),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.purple,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.purple,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.purple,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.purple,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.purple,
                                                ),
                                                Text("5.0",
                                                    style: TextStyle(
                                                        color: Colors.purple))
                                              ],
                                            )
                                          ],
                                        ),
                                        Text(
                                          //"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试",
                                          advisor.introduction,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [Text("707"), Text("Readings")],
                                  ),
                                  Column(
                                    children: [Text("3.2h"), Text("Response in")],
                                  ),
                                  TextButton(
                                      style:
                                      TextButton.styleFrom(
                                        backgroundColor:
                                        Colors.orangeAccent,
                                        foregroundColor:
                                        Colors.white,
                                        padding: EdgeInsets
                                            .symmetric(
                                            horizontal: 20,
                                            vertical: 5),
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                        MaterialTapTargetSize
                                            .shrinkWrap,
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Consult Now",
                                        maxLines: 1,
                                      ))
                                ],
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),

            /// 文本 New Advisor
            Row(children: [Icon(Icons.icecream_outlined), Text("New Advisor")]),

            /// 下方顾问卡片列表
            Container(
              width: double.maxFinite,
              height: 1500,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                      flex: 1,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Stack(
                                children: [
                                  /// 头像 + topAccuracy按钮 + 五个图标
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 20,
                                      child: Card(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.cyan,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                right: 0,
                                                bottom: 0,
                                                child: Image(
                                                  image: AssetImage(
                                                      advisorList[1].avatar),
                                                  fit: BoxFit.cover,
                                                )),
                                            Positioned(
                                                top: 5,
                                                left: 5,
                                                right: 5,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            "Top Accuracy",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12),
                                                          ),
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors.yellow
                                                                    .shade400,
                                                            minimumSize:
                                                                Size.zero,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        10),
                                                            tapTargetSize:
                                                                MaterialTapTargetSize
                                                                    .shrinkWrap,
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                                  Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                                  Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                                  Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                                  Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                                  Colors.purple,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                      )),

                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "New",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.orange.shade800,
                                                    minimumSize: Size.zero,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1,
                                                            horizontal: 4),
                                                    tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[1].name,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.purple),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            "5.0",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .yellow),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[1].introduction,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )),
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.greenAccent,
                                                      size: 15,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior: Clip.hardEdge,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text("707"),
                                                            Text("Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text("3.2h"),
                                                            Text(
                                                              "Response in",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.orangeAccent,
                                                        foregroundColor:
                                                            Colors.white,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 30,
                                                                vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          'advisor',
                                                          arguments: ScreenArguments(1),
                                                        );
                                                      },
                                                      child: Text(
                                                        "Consult Now",
                                                        maxLines: 1,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              )
                          ),
                          Expanded(
                              flex: 1,
                              child: Stack(
                                children: [
                                  /// 头像 + topAccuracy按钮 + 五个图标
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 20,
                                      child: Card(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.cyan,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                right: 0,
                                                bottom: 0,
                                                child: Image(
                                                  image: AssetImage(
                                                      advisorList[2].avatar),
                                                  fit: BoxFit.cover,
                                                )),
                                            Positioned(
                                                top: 5,
                                                left: 5,
                                                right: 5,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            "Top Accuracy",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontSize: 12),
                                                          ),
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                            Colors.yellow
                                                                .shade400,
                                                            minimumSize:
                                                            Size.zero,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                vertical: 5,
                                                                horizontal:
                                                                10),
                                                            tapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                      )),

                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "New",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                    Colors.orange.shade800,
                                                    minimumSize: Size.zero,
                                                    padding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 1,
                                                        horizontal: 4),
                                                    tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[2].name,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                              FontWeight.w700),
                                                        )),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                          color: Colors.purple),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            "5.0",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .yellow),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[2].introduction,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.greenAccent,
                                                      size: 15,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior: Clip.hardEdge,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text("707"),
                                                            Text("Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text("3.2h"),
                                                            Text(
                                                              "Response in",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  TextButton(
                                                      style:
                                                      TextButton.styleFrom(
                                                        backgroundColor:
                                                        Colors.orangeAccent,
                                                        foregroundColor:
                                                        Colors.white,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          'advisor',
                                                          arguments: ScreenArguments(2),
                                                        );
                                                      },
                                                      child: Text(
                                                        "Consult Now",
                                                        maxLines: 1,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              )),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Stack(
                                children: [
                                  /// 头像 + topAccuracy按钮 + 五个图标
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 20,
                                      child: Card(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.cyan,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                right: 0,
                                                bottom: 0,
                                                child: Image(
                                                  image: AssetImage(
                                                      advisorList[3].avatar),
                                                  fit: BoxFit.cover,
                                                )),
                                            Positioned(
                                                top: 5,
                                                left: 5,
                                                right: 5,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            "Top Accuracy",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontSize: 12),
                                                          ),
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                            Colors.yellow
                                                                .shade400,
                                                            minimumSize:
                                                            Size.zero,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                vertical: 5,
                                                                horizontal:
                                                                10),
                                                            tapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                      )),

                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "New",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                    Colors.orange.shade800,
                                                    minimumSize: Size.zero,
                                                    padding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 1,
                                                        horizontal: 4),
                                                    tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[3].name,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                              FontWeight.w700),
                                                        )),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                          color: Colors.purple),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            "5.0",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .yellow),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[3].introduction,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.greenAccent,
                                                      size: 15,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior: Clip.hardEdge,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text("707"),
                                                            Text("Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text("3.2h"),
                                                            Text(
                                                              "Response in",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  TextButton(
                                                      style:
                                                      TextButton.styleFrom(
                                                        backgroundColor:
                                                        Colors.orangeAccent,
                                                        foregroundColor:
                                                        Colors.white,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          'advisor',
                                                          arguments: ScreenArguments(3),
                                                        );
                                                      },
                                                      child: Text(
                                                        "Consult Now",
                                                        maxLines: 1,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Stack(
                                children: [
                                  /// 头像 + topAccuracy按钮 + 五个图标
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 20,
                                      child: Card(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.cyan,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                right: 0,
                                                bottom: 0,
                                                child: Image(
                                                  image: AssetImage(
                                                      advisorList[4].avatar),
                                                  fit: BoxFit.cover,
                                                )),
                                            Positioned(
                                                top: 5,
                                                left: 5,
                                                right: 5,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            "Top Accuracy",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontSize: 12),
                                                          ),
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                            Colors.yellow
                                                                .shade400,
                                                            minimumSize:
                                                            Size.zero,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                vertical: 5,
                                                                horizontal:
                                                                10),
                                                            tapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                      )),

                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "New",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                    Colors.orange.shade800,
                                                    minimumSize: Size.zero,
                                                    padding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 1,
                                                        horizontal: 4),
                                                    tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[4].name,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                              FontWeight.w700),
                                                        )),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                          color: Colors.purple),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            "5.0",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .yellow),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[4].introduction,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.greenAccent,
                                                      size: 15,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior: Clip.hardEdge,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text("707"),
                                                            Text("Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text("3.2h"),
                                                            Text(
                                                              "Response in",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  TextButton(
                                                      style:
                                                      TextButton.styleFrom(
                                                        backgroundColor:
                                                        Colors.orangeAccent,
                                                        foregroundColor:
                                                        Colors.white,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          'advisor',
                                                          arguments: ScreenArguments(4),
                                                        );
                                                      },
                                                      child: Text(
                                                        "Consult Now",
                                                        maxLines: 1,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              )),
                        ],
                      ),
                    ),
                  Expanded(
                      flex: 1,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Stack(
                                children: [
                                  /// 头像 + topAccuracy按钮 + 五个图标
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 20,
                                      child: Card(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.cyan,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                right: 0,
                                                bottom: 0,
                                                child: Image(
                                                  image: AssetImage(
                                                      advisorList[5].avatar),
                                                  fit: BoxFit.cover,
                                                )),
                                            Positioned(
                                                top: 5,
                                                left: 5,
                                                right: 5,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            "Top Accuracy",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontSize: 12),
                                                          ),
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                            Colors.yellow
                                                                .shade400,
                                                            minimumSize:
                                                            Size.zero,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                vertical: 5,
                                                                horizontal:
                                                                10),
                                                            tapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                      )),

                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "New",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                    Colors.orange.shade800,
                                                    minimumSize: Size.zero,
                                                    padding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 1,
                                                        horizontal: 4),
                                                    tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[5].name,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                              FontWeight.w700),
                                                        )),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                          color: Colors.purple),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            "5.0",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .yellow),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[5].introduction,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.greenAccent,
                                                      size: 15,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior: Clip.hardEdge,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text("707"),
                                                            Text("Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text("3.2h"),
                                                            Text(
                                                              "Response in",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  TextButton(
                                                      style:
                                                      TextButton.styleFrom(
                                                        backgroundColor:
                                                        Colors.orangeAccent,
                                                        foregroundColor:
                                                        Colors.white,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          'advisor',
                                                          arguments: ScreenArguments(5),
                                                        );
                                                      },
                                                      child: Text(
                                                        "Consult Now",
                                                        maxLines: 1,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Stack(
                                children: [
                                  /// 头像 + topAccuracy按钮 + 五个图标
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 20,
                                      child: Card(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.cyan,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                right: 0,
                                                bottom: 0,
                                                child: Image(
                                                  image: AssetImage(
                                                      advisorList[6].avatar),
                                                  fit: BoxFit.cover,
                                                )),
                                            Positioned(
                                                top: 5,
                                                left: 5,
                                                right: 5,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            "Top Accuracy",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontSize: 12),
                                                          ),
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                            Colors.yellow
                                                                .shade400,
                                                            minimumSize:
                                                            Size.zero,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                vertical: 5,
                                                                horizontal:
                                                                10),
                                                            tapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                      )),

                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "New",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                    Colors.orange.shade800,
                                                    minimumSize: Size.zero,
                                                    padding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 1,
                                                        horizontal: 4),
                                                    tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[6].name,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                              FontWeight.w700),
                                                        )),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                          color: Colors.purple),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            "5.0",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .yellow),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[6].introduction,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.greenAccent,
                                                      size: 15,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior: Clip.hardEdge,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text("707"),
                                                            Text("Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text("3.2h"),
                                                            Text(
                                                              "Response in",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  TextButton(
                                                      style:
                                                      TextButton.styleFrom(
                                                        backgroundColor:
                                                        Colors.orangeAccent,
                                                        foregroundColor:
                                                        Colors.white,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          'advisor',
                                                          arguments: ScreenArguments(6),
                                                        );
                                                      },
                                                      child: Text(
                                                        "Consult Now",
                                                        maxLines: 1,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              )),
                        ],
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Stack(
                                children: [
                                  /// 头像 + topAccuracy按钮 + 五个图标
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 20,
                                      child: Card(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.cyan,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                right: 0,
                                                bottom: 0,
                                                child: Image(
                                                  image: AssetImage(
                                                      advisorList[7].avatar),
                                                  fit: BoxFit.cover,
                                                )),
                                            Positioned(
                                                top: 5,
                                                left: 5,
                                                right: 5,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            "Top Accuracy",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontSize: 12),
                                                          ),
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                            Colors.yellow
                                                                .shade400,
                                                            minimumSize:
                                                            Size.zero,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                vertical: 5,
                                                                horizontal:
                                                                10),
                                                            tapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                      )),

                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "New",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                    Colors.orange.shade800,
                                                    minimumSize: Size.zero,
                                                    padding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 1,
                                                        horizontal: 4),
                                                    tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[7].name,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                              FontWeight.w700),
                                                        )),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                          color: Colors.purple),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            "5.0",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .yellow),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[7].introduction,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.greenAccent,
                                                      size: 15,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior: Clip.hardEdge,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text("707"),
                                                            Text("Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text("3.2h"),
                                                            Text(
                                                              "Response in",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  TextButton(
                                                      style:
                                                      TextButton.styleFrom(
                                                        backgroundColor:
                                                        Colors.orangeAccent,
                                                        foregroundColor:
                                                        Colors.white,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          'advisor',
                                                          arguments: ScreenArguments(7),
                                                        );
                                                      },
                                                      child: Text(
                                                        "Consult Now",
                                                        maxLines: 1,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              )
                          ),
                          Expanded(
                              flex: 1,
                              child: Stack(
                                children: [
                                  /// 头像 + topAccuracy按钮 + 五个图标
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 20,
                                      child: Card(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.cyan,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                right: 0,
                                                bottom: 0,
                                                child: Image(
                                                  image: AssetImage(
                                                      advisorList[8].avatar),
                                                  fit: BoxFit.cover,
                                                )),
                                            Positioned(
                                                top: 5,
                                                left: 5,
                                                right: 5,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            "Top Accuracy",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontSize: 12),
                                                          ),
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                            Colors.yellow
                                                                .shade400,
                                                            minimumSize:
                                                            Size.zero,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                vertical: 5,
                                                                horizontal:
                                                                10),
                                                            tapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                      )),

                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "New",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                    Colors.orange.shade800,
                                                    minimumSize: Size.zero,
                                                    padding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 1,
                                                        horizontal: 4),
                                                    tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[8].name,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                              FontWeight.w700),
                                                        )),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                          color: Colors.purple),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            "5.0",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .yellow),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[8].introduction,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.greenAccent,
                                                      size: 15,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior: Clip.hardEdge,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text("707"),
                                                            Text("Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text("3.2h"),
                                                            Text(
                                                              "Response in",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  TextButton(
                                                      style:
                                                      TextButton.styleFrom(
                                                        backgroundColor:
                                                        Colors.orangeAccent,
                                                        foregroundColor:
                                                        Colors.white,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          'advisor',
                                                          arguments: ScreenArguments(8),
                                                        );
                                                      },
                                                      child: Text(
                                                        "Consult Now",
                                                        maxLines: 1,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              )),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Stack(
                                children: [
                                  /// 头像 + topAccuracy按钮 + 五个图标
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 20,
                                      child: Card(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.cyan,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                right: 0,
                                                bottom: 0,
                                                child: Image(
                                                  image: AssetImage(
                                                      advisorList[9].avatar),
                                                  fit: BoxFit.cover,
                                                )),
                                            Positioned(
                                                top: 5,
                                                left: 5,
                                                right: 5,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            "Top Accuracy",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontSize: 12),
                                                          ),
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                            Colors.yellow
                                                                .shade400,
                                                            minimumSize:
                                                            Size.zero,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                vertical: 5,
                                                                horizontal:
                                                                10),
                                                            tapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                      )),

                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "New",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                    Colors.orange.shade800,
                                                    minimumSize: Size.zero,
                                                    padding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 1,
                                                        horizontal: 4),
                                                    tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[9].name,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                              FontWeight.w700),
                                                        )),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                          color: Colors.purple),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            "5.0",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .yellow),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[9].introduction,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.greenAccent,
                                                      size: 15,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior: Clip.hardEdge,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text("707"),
                                                            Text("Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text("3.2h"),
                                                            Text(
                                                              "Response in",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  TextButton(
                                                      style:
                                                      TextButton.styleFrom(
                                                        backgroundColor:
                                                        Colors.orangeAccent,
                                                        foregroundColor:
                                                        Colors.white,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          'advisor',
                                                          arguments: ScreenArguments(9),
                                                        );
                                                      },
                                                      child: Text(
                                                        "Consult Now",
                                                        maxLines: 1,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Stack(
                                children: [
                                  /// 头像 + topAccuracy按钮 + 五个图标
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 20,
                                      child: Card(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        color: Colors.cyan,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                right: 0,
                                                bottom: 0,
                                                child: Image(
                                                  image: AssetImage(
                                                      advisorList[0].avatar),
                                                  fit: BoxFit.cover,
                                                )),
                                            Positioned(
                                                top: 5,
                                                left: 5,
                                                right: 5,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            "Top Accuracy",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontSize: 12),
                                                          ),
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                            Colors.yellow
                                                                .shade400,
                                                            minimumSize:
                                                            Size.zero,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                vertical: 5,
                                                                horizontal:
                                                                10),
                                                            tapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                          ),
                                                        ),
                                                        Column(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),
                                          ],
                                        ),
                                      )),

                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "New",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                    Colors.orange.shade800,
                                                    minimumSize: Size.zero,
                                                    padding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 1,
                                                        horizontal: 4),
                                                    tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[0].name,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20,
                                                              fontWeight:
                                                              FontWeight.w700),
                                                        )),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                          color: Colors.purple),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            "5.0",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .yellow),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          advisorList[0].introduction,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.greenAccent,
                                                      size: 15,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Card(
                                            clipBehavior: Clip.hardEdge,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text("707"),
                                                            Text("Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text("3.2h"),
                                                            Text(
                                                              "Response in",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  TextButton(
                                                      style:
                                                      TextButton.styleFrom(
                                                        backgroundColor:
                                                        Colors.orangeAccent,
                                                        foregroundColor:
                                                        Colors.white,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                          context,
                                                          'advisor',
                                                          arguments: ScreenArguments(0),
                                                        );
                                                      },
                                                      child: Text(
                                                        "Consult Now",
                                                        maxLines: 1,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              )),
                        ],
                      )),
                ],
              ),
            ),

            /// 文本 My Favorites
            Row(children: [Icon(Icons.icecream_outlined), Text("My Favorites")]),

            /// 底部横向收藏列表
            SizedBox(
                height: 100,
                child: ValueListenableBuilder(
                        valueListenable: DBUtil.instance.userBox.listenable(),
                        builder: (context, Box box, _) {
                          User user = box.getAt(0);
                          List<String> list = [];
                          for (var i = 0; i < user.likedList.length; i++) {
                            list.add(user.likedList[i].avatar);
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: user.likedList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CircleAvatar(
                                backgroundImage:
                                AssetImage(list[list.length - 1 - index]),
                                radius: 30,
                              );
                            },
                          );
                        })
                
            )

          ],
        ));
  }
}
