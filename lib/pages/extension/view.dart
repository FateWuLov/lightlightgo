import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/decoration.dart';
import '../../models/advisormodel.dart';
import 'logic.dart';

class ExtensionPage extends StatelessWidget {
  final logic = Get.put(ExtensionPageLogic());
  final state = Get
      .find<ExtensionPageLogic>()
      .state;

  ExtensionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: extensionPageAppBar(),
      backgroundColor: Colors.white,
      body: extensionPageBody(),
    );
  }

  AppBar extensionPageAppBar() {
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
          child: IconButton(
              onPressed: () {}, icon: const Icon(Icons.search_sharp)),
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return MyDecoration.gradient2.createShader(bounds);
          },
          child: IconButton(
              onPressed: () {}, icon: const Icon(Icons.change_circle_outlined)),
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return MyDecoration.gradient2.createShader(bounds);
          },
          child: IconButton(
              onPressed: () {}, icon: const Icon(Icons.trip_origin)),
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }

  Widget extensionPageBody() {
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 0),
                      foregroundColor: Colors.purple,
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shadowColor: Colors.purple),
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.purple.shade50,
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(flex: 1, child: Icon(Icons.add)),
                        Expanded(
                            flex: 12,
                            child: Container(
                              height: 20,
                              alignment: Alignment.center,
                              child:
                              const Text(
                                  "Check in everyday to get free bonus."),
                            )),
                        const Expanded(flex: 1, child: Icon(Icons.abc))
                      ],
                    ),
                  ),
                ),
              );
            }),

            /// 上方大卡片
            LayoutBuilder(builder: (context, constraints) {
              final width = constraints.maxWidth;
              Advisor advisor = state.advisorList[0];
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
                        shape: const RoundedRectangleBorder(
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
                                    image: NetworkImage(advisor.avatar),
                                    fit: BoxFit.cover)),
                            Positioned(
                                top: 5,
                                right: 5,
                                child: Row(
                                  children: const [
                                    Icon(Icons.star, color: Colors.purple),
                                    Icon(Icons.star, color: Colors.purple),
                                    Icon(Icons.star, color: Colors.purple),
                                    Icon(Icons.star, color: Colors.purple)
                                  ],
                                ))
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.yellow.shade400,
                                minimumSize: Size.zero,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                "Top Accuracy",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: CircleAvatar(
                                    backgroundImage:
                                    NetworkImage(advisor.avatar),
                                    radius: 25,
                                  ),
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Text(advisor.name,
                                                    maxLines: 1,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: Colors.purple))),
                                            Row(
                                              children: const [
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
                                          style: const TextStyle(
                                              color: Colors.white),
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: const [
                                        Text("707"),
                                        Text("Readings")
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Text("3.2h"),
                                        Text("Response in")
                                      ],
                                    ),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.orangeAccent,
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          minimumSize: Size.zero,
                                          tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          "Consult Now",
                                          maxLines: 1,
                                        ))
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),

            /// 文本 New Advisor
            Row(children: const [
              Icon(Icons.icecream_outlined),
              Text("New Advisor")
            ]),

            /// 下方顾问卡片列表
            SizedBox(
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
                                        shape: const RoundedRectangleBorder(
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
                                                  image: NetworkImage(state
                                                      .advisorList[1].avatar),
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
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                            Colors.yellow
                                                                .shade400,
                                                            minimumSize:
                                                            Size.zero,
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 5,
                                                                horizontal:
                                                                10),
                                                            tapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                          ),
                                                          child: const Text(
                                                            "Top Accuracy",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: const [
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                    Colors.orange.shade800,
                                                    minimumSize: Size.zero,
                                                    padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 1,
                                                        horizontal: 4),
                                                    tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                  ),
                                                  child: const Text(
                                                    "New",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          state.advisorList[1]
                                                              .name,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white,
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
                                                        children: const [
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
                                                          state.advisorList[1]
                                                              .introduction,
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    const Icon(
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
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: const [
                                                            Text("707"),
                                                            Text("Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: const [
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
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        logic
                                                            .jumpToAdvisorDetailPage(
                                                            state.advisorList[
                                                            1]);
                                                      },
                                                      child: const Text(
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
                                        shape: const RoundedRectangleBorder(
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
                                                  image: NetworkImage(state
                                                      .advisorList[2].avatar),
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
                                                          style: TextButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                            Colors.yellow
                                                                .shade400,
                                                            minimumSize:
                                                            Size.zero,
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                vertical: 5,
                                                                horizontal:
                                                                10),
                                                            tapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                          ),
                                                          child: const Text(
                                                            "Top Accuracy",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: const [
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                    Colors.orange.shade800,
                                                    minimumSize: Size.zero,
                                                    padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 1,
                                                        horizontal: 4),
                                                    tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                  ),
                                                  child: const Text(
                                                    "New",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                          state.advisorList[2]
                                                              .name,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white,
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
                                                        children: const [
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
                                                          state.advisorList[2]
                                                              .introduction,
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    const Icon(
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
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: const [
                                                            Text("707"),
                                                            Text("Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: const [
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
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        logic
                                                            .jumpToAdvisorDetailPage(
                                                            state.advisorList[
                                                            2]);
                                                      },
                                                      child: const Text(
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
                                      shape: const RoundedRectangleBorder(
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
                                                image: NetworkImage(state
                                                    .advisorList[3].avatar),
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
                                                        style: TextButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                          Colors.yellow
                                                              .shade400,
                                                          minimumSize:
                                                          Size.zero,
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              vertical: 5,
                                                              horizontal:
                                                              10),
                                                          tapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                        ),
                                                        child: const Text(
                                                          "Top Accuracy",
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w400,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                      Column(
                                                        children: const [
                                                          Icon(
                                                            Icons.rocket_launch,
                                                            color:
                                                            Colors.purple,
                                                          ),
                                                          Icon(
                                                            Icons.rocket_launch,
                                                            color:
                                                            Colors.purple,
                                                          ),
                                                          Icon(
                                                            Icons.rocket_launch,
                                                            color:
                                                            Colors.purple,
                                                          ),
                                                          Icon(
                                                            Icons.rocket_launch,
                                                            color:
                                                            Colors.purple,
                                                          ),
                                                          Icon(
                                                            Icons.rocket_launch,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                  Colors.orange.shade800,
                                                  minimumSize: Size.zero,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 1,
                                                      horizontal: 4),
                                                  tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                                ),
                                                child: const Text(
                                                  "New",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                        state.advisorList[3]
                                                            .name,
                                                        style: const TextStyle(
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
                                                      children: const [
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
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
                                                        state.advisorList[3]
                                                            .introduction,
                                                        maxLines: 1,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontWeight:
                                                            FontWeight.w500),
                                                      )),
                                                  const Icon(
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
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 7),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(
                                                      0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        children: const [
                                                          Text("707"),
                                                          Text("Readings",
                                                              style: TextStyle(
                                                                  fontSize: 10))
                                                        ],
                                                      ),
                                                      Column(
                                                        children: const [
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
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                      Colors.orangeAccent,
                                                      foregroundColor:
                                                      Colors.white,
                                                      padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 30,
                                                          vertical: 5),
                                                      minimumSize: Size.zero,
                                                      tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                    ),
                                                    onPressed: () {
                                                      logic
                                                          .jumpToAdvisorDetailPage(
                                                          state.advisorList[
                                                          3]);
                                                    },
                                                    child: const Text(
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
                                      shape: const RoundedRectangleBorder(
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
                                                image: NetworkImage(state
                                                    .advisorList[4].avatar),
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
                                                        child: const Text(
                                                          "Top Accuracy",
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black,
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
                                                          padding: const EdgeInsets
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
                                                        children: const [
                                                          Icon(
                                                            Icons.rocket_launch,
                                                            color:
                                                            Colors.purple,
                                                          ),
                                                          Icon(
                                                            Icons.rocket_launch,
                                                            color:
                                                            Colors.purple,
                                                          ),
                                                          Icon(
                                                            Icons.rocket_launch,
                                                            color:
                                                            Colors.purple,
                                                          ),
                                                          Icon(
                                                            Icons.rocket_launch,
                                                            color:
                                                            Colors.purple,
                                                          ),
                                                          Icon(
                                                            Icons.rocket_launch,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                  Colors.orange.shade800,
                                                  minimumSize: Size.zero,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 1,
                                                      horizontal: 4),
                                                  tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                                ),
                                                child: const Text(
                                                  "New",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                        state.advisorList[4]
                                                            .name,
                                                        style: const TextStyle(
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
                                                      children: const [
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
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
                                                        state.advisorList[4]
                                                            .introduction,
                                                        maxLines: 1,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontWeight:
                                                            FontWeight.w500),
                                                      )),
                                                  const Icon(
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
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 7),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(
                                                      0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        children: const [
                                                          Text("707"),
                                                          Text("Readings",
                                                              style: TextStyle(
                                                                  fontSize: 10))
                                                        ],
                                                      ),
                                                      Column(
                                                        children: const [
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
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                      Colors.orangeAccent,
                                                      foregroundColor:
                                                      Colors.white,
                                                      padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 30,
                                                          vertical: 5),
                                                      minimumSize: Size.zero,
                                                      tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                    ),
                                                    onPressed: () {
                                                      logic
                                                          .jumpToAdvisorDetailPage(
                                                          state.advisorList[
                                                          4]);
                                                    },
                                                    child: const Text(
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
                                        shape: const RoundedRectangleBorder(
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
                                                  image: NetworkImage(state
                                                      .advisorList[5].avatar),
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
                                                          child: const Text(
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
                                                            padding: const EdgeInsets
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
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
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
                                                    const EdgeInsets.symmetric(
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
                                                          state.advisorList[5]
                                                              .name,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white,
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
                                                          const Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          const Text(
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
                                                          state.advisorList[5]
                                                              .introduction,
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    const Icon(
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
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            const Text("707"),
                                                            const Text(
                                                                "Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            const Text("3.2h"),
                                                            const Text(
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
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        logic
                                                            .jumpToAdvisorDetailPage(
                                                            state.advisorList[
                                                            5]);
                                                      },
                                                      child: const Text(
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
                                        shape: const RoundedRectangleBorder(
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
                                                  image: NetworkImage(state
                                                      .advisorList[6].avatar),
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
                                                          child: const Text(
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
                                                            padding: const EdgeInsets
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
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
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
                                                    const EdgeInsets.symmetric(
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
                                                          state.advisorList[6]
                                                              .name,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white,
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
                                                          const Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          const Text(
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
                                                          state.advisorList[6]
                                                              .introduction,
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    const Icon(
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
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            const Text("707"),
                                                            const Text(
                                                                "Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            const Text("3.2h"),
                                                            const Text(
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
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        logic
                                                            .jumpToAdvisorDetailPage(
                                                            state.advisorList[
                                                            6]);
                                                      },
                                                      child: const Text(
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
                                        shape: const RoundedRectangleBorder(
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
                                                  image: NetworkImage(state
                                                      .advisorList[7].avatar),
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
                                                          child: const Text(
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
                                                            padding: const EdgeInsets
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
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
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
                                                    const EdgeInsets.symmetric(
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
                                                          state.advisorList[7]
                                                              .name,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white,
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
                                                          const Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          const Text(
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
                                                          state.advisorList[7]
                                                              .introduction,
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    const Icon(
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
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            const Text("707"),
                                                            const Text(
                                                                "Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            const Text("3.2h"),
                                                            const Text(
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
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        logic
                                                            .jumpToAdvisorDetailPage(
                                                            state.advisorList[
                                                            7]);
                                                      },
                                                      child: const Text(
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
                                        shape: const RoundedRectangleBorder(
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
                                                  image: NetworkImage(state
                                                      .advisorList[8].avatar),
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
                                                          child: const Text(
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
                                                            padding: const EdgeInsets
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
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
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
                                                    const EdgeInsets.symmetric(
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
                                                          state.advisorList[8]
                                                              .name,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white,
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
                                                          const Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          const Text(
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
                                                          state.advisorList[8]
                                                              .introduction,
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    const Icon(
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
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            const Text("707"),
                                                            const Text(
                                                                "Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            const Text("3.2h"),
                                                            const Text(
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
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        logic
                                                            .jumpToAdvisorDetailPage(
                                                            state.advisorList[
                                                            8]);
                                                        ;
                                                      },
                                                      child: const Text(
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
                                      shape: const RoundedRectangleBorder(
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
                                                image: NetworkImage(state
                                                    .advisorList[9].avatar),
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
                                                        child: const Text(
                                                          "Top Accuracy",
                                                          style: TextStyle(
                                                              color:
                                                              Colors.black,
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
                                                          padding: const EdgeInsets
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
                                                          const Icon(
                                                            Icons.rocket_launch,
                                                            color:
                                                            Colors.purple,
                                                          ),
                                                          const Icon(
                                                            Icons.rocket_launch,
                                                            color:
                                                            Colors.purple,
                                                          ),
                                                          const Icon(
                                                            Icons.rocket_launch,
                                                            color:
                                                            Colors.purple,
                                                          ),
                                                          const Icon(
                                                            Icons.rocket_launch,
                                                            color:
                                                            Colors.purple,
                                                          ),
                                                          const Icon(
                                                            Icons.rocket_launch,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text(
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
                                                  padding: const EdgeInsets
                                                      .symmetric(
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
                                                        state.advisorList[9]
                                                            .name,
                                                        style: const TextStyle(
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
                                                        const Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
                                                          size: 15,
                                                        ),
                                                        const Text(
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
                                                        state.advisorList[9]
                                                            .introduction,
                                                        maxLines: 1,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontWeight:
                                                            FontWeight.w500),
                                                      )),
                                                  const Icon(
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
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          color: Colors.white,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 7),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .fromLTRB(
                                                      0, 0, 0, 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          const Text("707"),
                                                          const Text("Readings",
                                                              style: TextStyle(
                                                                  fontSize: 10))
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          const Text("3.2h"),
                                                          const Text(
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
                                                    style: TextButton.styleFrom(
                                                      backgroundColor:
                                                      Colors.orangeAccent,
                                                      foregroundColor:
                                                      Colors.white,
                                                      padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 30,
                                                          vertical: 5),
                                                      minimumSize: Size.zero,
                                                      tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                    ),
                                                    onPressed: () {
                                                      logic
                                                          .jumpToAdvisorDetailPage(
                                                          state.advisorList[
                                                          9]);
                                                    },
                                                    child: const Text(
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
                                        shape: const RoundedRectangleBorder(
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
                                                  image: NetworkImage(state
                                                      .advisorList[0].avatar),
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
                                                          child: const Text(
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
                                                            padding: const EdgeInsets
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
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
                                                              Icons
                                                                  .rocket_launch,
                                                              color:
                                                              Colors.purple,
                                                            ),
                                                            const Icon(
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
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
                                                    const EdgeInsets.symmetric(
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
                                                          state.advisorList[0]
                                                              .name,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white,
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
                                                          const Icon(
                                                            Icons.star,
                                                            color:
                                                            Colors.yellow,
                                                            size: 15,
                                                          ),
                                                          const Text(
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
                                                          state.advisorList[0]
                                                              .introduction,
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight.w500),
                                                        )),
                                                    const Icon(
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
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10, vertical: 7),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            const Text("707"),
                                                            const Text(
                                                                "Readings",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    10))
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            const Text("3.2h"),
                                                            const Text(
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
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 30,
                                                            vertical: 5),
                                                        minimumSize: Size.zero,
                                                        tapTargetSize:
                                                        MaterialTapTargetSize
                                                            .shrinkWrap,
                                                      ),
                                                      onPressed: () {
                                                        logic
                                                            .jumpToAdvisorDetailPage(
                                                            state.advisorList[
                                                            0]);
                                                      },
                                                      child: const Text(
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
            Row(children: [
              const Icon(Icons.icecream_outlined),
              const Text("My Favorites")
            ]),

            /// 底部横向收藏列表
            SizedBox(
                height: 100,
                child: GetBuilder<ExtensionPageLogic>(
                  id: state.likedListGID,
                    builder: (logic) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.user.likedList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CircleAvatar(
                        backgroundImage:
                        NetworkImage(state.user.likedList[state.user.likedList.length - 1 - index].avatar),
                        radius: 30,
                      );
                    },
                  );
                })
            ),
          ],
        ));
  }
}
