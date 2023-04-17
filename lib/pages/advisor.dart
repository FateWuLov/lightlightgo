import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../common/dbutil.dart';
import '../common/util.dart';
import '../models/advisormodel.dart';
import '../models/usermodel.dart';

class FMAdvisorVC extends StatefulWidget {
  const FMAdvisorVC({super.key});
  @override
  // TODO: implement build
  FMAdvisorState createState() => FMAdvisorState();
}

class FMAdvisorState extends State<FMAdvisorVC> {
  @override
  Widget build(BuildContext context) {
    //获取屏幕宽高
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    //获取传参：id
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    int index = args.index;
    DBUtil dbUtil = DBUtil.instance;
    Advisor advisor = dbUtil.advisorBox.getAt(index);
    // TODO: implement build
    return Container(
      width: width, height: height,
      //设置白色背景
      decoration: const BoxDecoration(color: Colors.white),
      ///层叠布局
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
                  AdvisorCard(index: index),
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
                            image: NetworkImage(advisor.avatar),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                ],
              ),
              /// 下方文本
              Container(
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: text(advisor),
              ),
            ],
          ),
          /// 顾问主页 -- 返回按钮
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 50, 0, 0),
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
              child: const SizedBox(
                width: 30,
                height: 30,
                child: Image(
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
  Widget text(Advisor advisor) {
    return Column(
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
              advisor.about,
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
    );
  }
}

/// 顾问名片
class AdvisorCard extends StatelessWidget{
  const AdvisorCard({super.key ,required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    DBUtil dbUtil = DBUtil.instance;
    Advisor advisor = dbUtil.advisorBox.getAt(index);
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),),
            //卡片内容
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                        const Padding(padding: EdgeInsets.fromLTRB(300, 0, 0, 0)),
                        SizedBox(
                          width: 40,
                          height: 30,
                          child: ValueListenableBuilder(
                            valueListenable: dbUtil.advisorBox.listenable(),
                            builder: (context, Box box, _) {
                              return IconButton(
                                alignment: Alignment.centerLeft,
                                onPressed: () {
                                  User user = dbUtil.userBox.getAt(0);
                                  print(" User -- > likedList : " + user.likedList.length.toString());
                                  if (advisor.liked){
                                    user.likedList.remove(advisor);
                                  } else {
                                    user.likedList.add(advisor);
                                  }
                                  print(" User -- > likedList : " + user.likedList.length.toString());
                                  advisor.liked = !advisor.liked;
                                  box.putAt(index, advisor);
                                  dbUtil.userBox.putAt(0, user);
                                },
                                icon: Icon(advisor.liked ? Icons.favorite_rounded :Icons.favorite_outline_rounded,
                                  color: Colors.pink,
                                  size: 30,
                                ),
                              );
                            },),
                        )

                      ],
                    ),
                  ),
                  /// 顾问主页 -- 名片 -- 名称
                  Container(
                    width: double.maxFinite,
                    padding:
                    const EdgeInsets.fromLTRB(20, 0, 0, 10),
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
                    padding:
                    const EdgeInsets.fromLTRB(20, 0, 0, 5),
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
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              ///顾问主页 -- 名片 -- 内嵌卡片 -- 文本 Text Reading
                              Text(
                                'TextReading',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              ///顾问主页 -- 名片 -- 内嵌卡片 -- 文本 Delivered within 24h
                              const Text(
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
                            child: SizedBox(
                              width: 80,
                              height: 30,
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
                            onPressed: () {
                              Navigator.pushNamed(context, 'buy' , arguments: ScreenArguments(index));
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

