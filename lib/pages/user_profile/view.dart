import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:lifeaste_lt/manager/userManager.dart';
import 'package:lifeaste_lt/pages/user_profile/logic.dart';
import 'package:lifeaste_lt/pages/user_profile/state.dart';

import '../../common/decoration.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({super.key});

  final logic = Get.put(UserProfileLogic());
  final state = Get
      .find<UserProfileLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: editAppbar(),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: editBody(),
      ),
    );
  }

  AppBar editAppbar() {
    return AppBar(
      bottom: null,
      centerTitle: true,
      leading: ShaderMask(
        shaderCallback: (Rect bounds) {
          return MyDecoration.gradient2.createShader(bounds);
        },
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      title: ShaderMask(
        shaderCallback: (Rect bounds) {
          return MyDecoration.gradient2.createShader(bounds);
        },
        child: const Text(
          "Profile Edit",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      actions: [
        TextButton(
          onPressed: () {
            /// 这里写点击save按钮后执行的操作
            if (state.myController1.value.text.isEmpty ||
                state.myController2.value.text.isEmpty ||
                state.myController3.value.text.isEmpty) {} else {
              logic.saveUser();
            }
          },
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return MyDecoration.gradient2.createShader(bounds);
            },
            child: const Text(
              "Save",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }

  Widget editBody() {
    return ListView(
      children: [
        BackgroundImageAndAvatar(),
        const SizedBox(height: 20),

        /// 文本 name
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Name",
            style: TextStyle(
                color: Colors.purple.shade800,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
        ),

        /// 输入框
        Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          //width: double.maxFinite,
          child: TextField(
            controller: state.myController1,
            //autofocus: true,
            decoration: const InputDecoration(hintText: "Input your name"),
            maxLength: 15,
            maxLengthEnforcement: MaxLengthEnforcement.none,
          ),
        ),

        /// 文本 bio
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Text(
            "Bio",
            style: TextStyle(
                color: Colors.purple.shade800,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
        ),

        /// 输入框
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: TextField(
            controller: state.myController2,
            //autofocus: true,
            decoration: const InputDecoration(hintText: "Input your Bio"),
            maxLength: 100,
            maxLines: 1,
          ),
        ),

        /// 文本 gender
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Gender",
            style: TextStyle(
                color: Colors.purple.shade800,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
        ),
        const SizedBox(height: 20),

        /// 性别选择项
        GetBuilder<UserProfileLogic>(
          id: state.genderGID,
          builder: (logic) {
            return GenderDemo();
          },
        ),
        const SizedBox(height: 20),

        /// 文本 birthday
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Birthday",
            style: TextStyle(
                color: Colors.purple.shade800,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
        ),

        /// 生日选择
        BirthDemo(),
        const SizedBox(height: 20),

        /// 文本 about me
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
          child: Text(
            "About Me",
            style: TextStyle(
                color: Colors.purple.shade800,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
        ),
        const SizedBox(height: 10),

        /// 输入框
        AboutDemo(),
      ],
    );
  }
}

class BackgroundImageAndAvatar extends StatelessWidget {
  final logic = Get.put(UserProfileLogic());
  final state = Get
      .find<UserProfileLogic>()
      .state;

  BackgroundImageAndAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: double.maxFinite,
      height: 260,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Image.asset("assets/bg.jpg"),
          ),
          Positioned(
            top: 100,
            child: TextButton(
              onPressed: () {
                /// 这里写点击头像后打开相册更换头像的逻辑
                ///
                showDialog(
                  context: context,
                  barrierColor: Colors.transparent, //设置透明底色,自定义也可能会用到
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("更换头像"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            //ImagePicker().pickImage(source: ImageSource.camera);
                          },
                          child: const Text('拍照'),
                        ),
                        TextButton(
                          onPressed: () {
                            //ImagePicker().pickImage(source: ImageSource.gallery);
                            logic.updateAvatar();
                          },
                          child: const Text('相册选图'),
                        ),
                      ],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    );
                  },
                );
              },
              child: GetBuilder<UserProfileLogic>(
                  id: state.avatarGID,
                  builder: (logic) {
                return CircleAvatar(
                  radius: 70,
                  backgroundImage: UserManager.setAvatar(state.user.avatar),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

class GenderDemo extends StatelessWidget {
  final logic = Get.put(UserProfileLogic());
  final state = Get
      .find<UserProfileLogic>()
      .state;

  GenderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RawChip(
            label: SizedBox(
              height: 50,
              width: 100,
              child: Column(
                children: const [
                  Icon(Icons.male),
                  Padding(padding: EdgeInsets.all(3)),
                  Text("Male")
                ],
              ),
            ),
            tooltip: "Male",
            selected: state.user.gender.compareTo("Male") == 0 ? true : false,
            onSelected: (value) {
              logic.setGender("Male");
            },
            selectedColor: Colors.purple,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.white,
            shape: null,
            showCheckmark: false,
          ),
          RawChip(
            label: SizedBox(
              height: 50,
              width: 100,
              child: Column(
                children: const [
                  Icon(Icons.female),
                  Padding(padding: EdgeInsets.all(3)),
                  Text("Female")
                ],
              ),
            ),
            tooltip: "Female",
            selected: state.user.gender.compareTo("Female") == 0 ? true : false,
            onSelected: (value) {
              logic.setGender("Female");
            },
            selectedColor: Colors.purple,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.white,
            shape: null,
            showCheckmark: false,
          ),
          RawChip(
            label: SizedBox(
              height: 50,
              width: 100,
              child: Column(
                children: const [
                  Icon(Icons.transgender),
                  Padding(padding: EdgeInsets.all(3)),
                  Text("Not Specified")
                ],
              ),
            ),
            tooltip: "Not Specified",
            selected: state.user.gender.compareTo("Not Specified") == 0
                ? true
                : false,
            onSelected: (value) {
              logic.setGender("Not Specified");
            },
            selectedColor: Colors.purple,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.white,
            shape: null,
            showCheckmark: false,
          ),
        ],
      ),
    );
  }
}

class BirthDemo extends StatelessWidget {
  final logic = Get.put(UserProfileLogic());
  final state = Get
      .find<UserProfileLogic>()
      .state;

  BirthDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(1900, 1, 1),
                    maxTime: DateTime.now(),
                    onChanged: (date) {
                      state.user.birth = date;
                    },
                    onConfirm: (date) {
                      state.user.birth = date;
                    },
                    currentTime: state.user.birth,
                    locale: LocaleType.zh);
              },
              child: SizedBox(
                width: double.maxFinite,
                child: Text(
                  "${state.user.birth.day}-${state.user.birth.month}-${state
                      .user.birth.year}",
                  style: const TextStyle(color: Colors.black),
                ),
              )),
          Container(
            height: 0.4,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

class AboutDemo extends StatelessWidget {
  final logic = Get.put(UserProfileLogic());
  final state = Get
      .find<UserProfileLogic>()
      .state;

  AboutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: TextField(
          controller: state.myController3,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          minLines: 5,
          decoration: InputDecoration(
            hintText: "Introduce yourself",
            filled: true,
            fillColor: Colors.grey.shade300,
            isCollapsed: true,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //isDense: true,
            border: const OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              //borderSide: BorderSide(width: 1, style: BorderStyle.none,),
            ),
          ),
          maxLength: 50,
        )
    );
  }
}
