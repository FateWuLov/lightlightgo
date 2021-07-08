
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeaste/pages/user_profile/state.dart';

import 'logic.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String _logicTag = '';
  UserProfileLogic logic = UserProfileLogic();
  UserProfileState state = UserProfileState();

  @override
  void initState() {
    super.initState();
    _logicTag = (Get.arguments?.hashCode.toString() ?? '') + DateTime.now().microsecondsSinceEpoch.toString();
    logic = Get.put(UserProfileLogic(), tag: _logicTag);
    state = Get.find<UserProfileLogic>(tag: _logicTag).state;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileLogic>(
      tag: _logicTag,
      id: state.rootGId,
      builder: (UserProfileLogic logic) {
        return Container();
      },
    );
  }
}
