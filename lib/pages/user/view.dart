import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste_lt/pages/user/logic.dart';

import '../../manager/userManager.dart';
import '../../routeConfig.dart';

class UserPage extends StatelessWidget {
  final logic = Get.put(UserPageLogic());
  final state = Get.find<UserPageLogic>().state;

  UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: CupertinoColors.white,
        child: Stack(
          children: [
            /// 背景bg2
            const Padding(
              padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
              child: Image(
                image: AssetImage("assets/3.0x/bg2.png"),
                fit: BoxFit.fill,
              ),
            ),

            /// 主体部分
            Column(
              children: [
                _editButton(),
                GetBuilder<UserPageLogic>(
                    builder: (logic) {
                      return _avatar();
                    }
                ),
                GetBuilder<UserPageLogic>(
                    builder: (logic) {
                      return _userName();
                    }
                ),
                _list(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _editButton() {
    return Container(
      width: double.maxFinite,
      height: 80,
      padding: const EdgeInsets.only(left: 365, top: 45, right: 30),
      child: IconButton(
        icon: const Icon(Icons.edit_calendar_outlined),
        iconSize: 30,
        onPressed: () {
          Get.toNamed(RouteConfig.userProfile);
        },
      ),
    );
  }

  Widget _avatar() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(30, 20, 285, 0),
      child: CircleAvatar(
        backgroundImage: UserManager.setAvatar(state.user.avatar),
        radius: 70,
      ),
    );
  }

  Widget _userName() {
    return Container(
        height: 50,
        width: double.maxFinite,
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Text(
          state.user.name,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ));
  }

  Widget _list() {
    return Column(
      children: [
        const SizedBox(height: 30),
        SizedBox(
          width: double.maxFinite,
          height: 80,
          child: Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 10)),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 25, 0, 25),
                child: Image(image: AssetImage("assets/3.0x/buy.png")),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: SizedBox(
                  width: 100,
                  child: Text(
                    "Buy Coins",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(190, 25, 0, 25),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_right),
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Container(
          color: Colors.black,
          height: 0.1,
          width: 380,
        ),
        SizedBox(
          width: double.maxFinite,
          height: 80,
          child: Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 10)),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 25, 0, 25),
                child: Image(image: AssetImage("assets/3.0x/Feedback.png")),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: SizedBox(
                  width: 100,
                  child: Text(
                    "Feedback",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(190, 25, 0, 25),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_right),
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Container(
          color: Colors.black,
          height: 0.1,
          width: 380,
        ),
        SizedBox(
          width: double.maxFinite,
          height: 80,
          child: Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 10)),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 25, 0, 25),
                child: Image(image: AssetImage("assets/3.0x/logout.png")),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: SizedBox(
                  width: 100,
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(190, 25, 0, 25),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_right),
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Container(
          color: Colors.black,
          height: 0.1,
          width: 380,
        ),
      ],
    );
  }
}
