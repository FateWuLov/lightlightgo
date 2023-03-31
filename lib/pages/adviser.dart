import 'package:flutter/material.dart';

class FMAdvisorVC extends StatefulWidget {
  const FMAdvisorVC({super.key});

  static const routeName = 'advisor';

  @override
  // TODO: implement build
  FMAdvisorState createState() => FMAdvisorState();
}

class FMAdvisorState extends State<FMAdvisorVC> {

  static bool status = false;
  static GlobalKey<_IconWidgetState> iconKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //获取宽高
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    //获取传参：头像、名字、简介
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    // TODO: implement build
    return Container(
      width: width,
      height: height,
      //设置白色背景
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      ///层叠布局
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(0),
            children: [
              /// 顾问主页 -- 除文本外区域
              Stack(
                children: [
                  /// 顾问主页 -- 背景图
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: Container(
                      height: width,
                      width: width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/3.0x/bg3.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  /// 顾问主页 -- 名片
                  Positioned(
                      bottom: 10,
                      child: Container(
                        alignment: Alignment.center,
                        width: width,
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
                            height: height / 4.5,
                            width: width - 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  height: height/23,
                                  child: Row(
                                    children: [
                                      Padding(padding: EdgeInsets.fromLTRB(width/1.4, height/80, 0, 0)),
                                      IconButton(
                                        onPressed: (){
                                          status = !status;
                                          iconKey.currentState?.onPressed(status);
                                        },
                                        icon: IconWidget(iconKey),
                                      ),
                                    ],
                                  ),
                                ),
                                /// 顾问主页 -- 名片 -- 名称
                                Container(
                                  width: double.maxFinite,
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 10),
                                  child: Text(
                                    args.title,
                                    style: const TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),

                                /// 顾问主页 -- 名片 -- 简介
                                Container(
                                  width: double.maxFinite,
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 5),
                                  child: Text(
                                    args.sub,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),

                                /// 顾问主页 -- 名片 -- 内嵌卡片
                                Container(
                                  width: width - 80,
                                  height: height / 12,
                                  /*decoration: BoxDecoration(
                                  border: border,
                                ),*/
                                  alignment: Alignment.center,
                                  child: Card(
                                    color: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    elevation: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            ///顾问主页 -- 名片 -- 内嵌卡片 -- 文本 Text Reading
                                            Text(
                                              "Text Reading",
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

                                        /// 顾问主页 -- 名片 -- 内嵌卡片 -- 金币按钮
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        18.67),
                                              ),
                                            ),
                                          ),
                                          child: Container(
                                            width: width / 5,
                                            height: height / 25,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                SizedBox(
                                                  width: 30,
                                                  height: 30,
                                                  child: Image(
                                                    image: AssetImage(
                                                        "assets/3.0x/coin.png"),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                Text(
                                                  "30",
                                                ),
                                              ],
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                  /// 顾问主页 -- 头像
                  Positioned(
                    left: 50,
                    bottom: 180,
                    child: Container(
                      height: width / 5,
                      width: width / 5,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                          image: DecorationImage(
                            image: AssetImage(args.avatar),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                ],
              ),
              /// 顾问主页 -- 下方文本
              Container(
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: text(),
              ),
            ],
          ),
          /// 顾问主页 -- 返回按钮
          Padding(
            padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(200),
                  ),
                ),
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: (){
                //点击返回后当前页面出栈
                Navigator.pop(context);
              },
              child: Container(
                width: 30,
                height: 30,
                child: const Image(
                  image: AssetImage("assets/3.0x/back.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 顾问主页 -- 下方文本实现
  Widget text() {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          child: const Padding(
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
        Container(
          width: double.maxFinite,
          child: const Padding(
            padding: EdgeInsets.fromLTRB(25, 20, 25, 30),
            child: Text(
              "Good morning, everyone. Thank you for taking your time. It’s really my honor to have this opportunity to take part in this interview. Now, I would like to introduce myself briefly."
              "My name is Doris. I am 23 years old and born in Qingdao. I graduated from Hebei University of Science and Technology. My major is English. And I got my bachelor degree after my graduation. I also studied Audit in Hebei Normal University of Science and Technology. I am very interested in English and study very hard on this subject. I had passed TEM-8 and BEC Vantage. I worked in an American company at the beginning of this year. My spoken English was improved a lot by communicating with Americans frequently during that period."
              "I am very optimistic and easy to get along with. I have many friends. Teamwork spirit is very important in this age. I think if we want to make big achievement, it’s very important to learn how to cooperate with other people. My motto is 'characters determine destity', so I alwarys remind myself to be honest and modest to everyone ."
              "As a motto goes 'attitude is everything'. If I get this job, I will put all my heart in it and try my best to do it well.",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Util -- 细线边框
  Border border = Border.all(
    color: Colors.orange,
    width: 2,
  );
}
/// 工具类 -- 获取传参：名字、简介、头像
class ScreenArguments {
  final String title;
  final String sub;
  final String avatar;

  ScreenArguments(this.title, this.sub, this.avatar);
}
/// 工具类 -- 局部刷新收藏按钮
class IconWidget extends StatefulWidget {
  final Key key;

  const IconWidget(this.key);

  @override
  _IconWidgetState createState() => _IconWidgetState();
}
/// 工具类 -- 局部刷新收藏按钮
class _IconWidgetState extends State<IconWidget> {

  ///未收藏
  Icon unlike = const Icon(
    Icons.favorite_outline_rounded,
    size: 30,
    color: Colors.grey,
  );
  ///收藏图标
  Icon like = const Icon(
    Icons.favorite_rounded,
    size: 30,
    color: Colors.pink,
  );

  Icon icon = const Icon(
    Icons.favorite_outline_rounded,
    size: 30,
    color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return icon;
  }

  void onPressed(bool status) {
    setState(() {
      icon = status? like: unlike;
    });
  }
}
