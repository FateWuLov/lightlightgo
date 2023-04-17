import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/common/decoration.dart';
import '../common/dbutil.dart';
import '../models/usermodel.dart';

User userNow = DBUtil.instance.userBox.getAt(0);
User userUtil = User('', '', '', userNow.birth, '', userNow.avatar, [], []);
final myController1 = TextEditingController();
final myController2 = TextEditingController();
final myController3 = TextEditingController();

class FMEditVC extends StatefulWidget {
  const FMEditVC({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FMEditVCState();
  }
}

class FMEditVCState extends State<FMEditVC> {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    myController1.value = TextEditingValue(
        text: userNow.name,
        selection: TextSelection.fromPosition(
            TextPosition(
                affinity: TextAffinity.downstream,
                offset: userNow.name.length)));
    myController2.value = TextEditingValue(
        text: userNow.bio,
        selection: TextSelection.fromPosition(
            TextPosition(
                affinity: TextAffinity.downstream,
                offset: userNow.bio.length)));
    myController3.value = TextEditingValue(
        text: userNow.about,
        selection: TextSelection.fromPosition(
            TextPosition(
                affinity: TextAffinity.downstream,
                offset: userNow.about.length)));
    // TODO: implement build
    return Scaffold(
      appBar: const EditAppbar(),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: const EditBody(),
      ),
    );
  }
}

class EditAppbar extends StatelessWidget implements PreferredSizeWidget {
  const EditAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            Navigator.pop(context);
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
                if (myController1.value.text.isEmpty ||
                    myController2.value.text.isEmpty ||
                    myController3.value.text.isEmpty) {

                } else {
                  DBUtil db = DBUtil.instance;
                  userNow.name = myController1.value.text;
                  userNow.bio = myController2.value.text;
                  userNow.about = myController3.value.text;
                  userNow.avatar = userUtil.avatar;
                  userNow.save();
                  Navigator.pop(context);
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

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(40);
}

class EditBody extends StatefulWidget {
  const EditBody({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditBodyState();
  }
}

class EditBodyState extends State<EditBody> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        BackgroundImageAndAvatar(),
        SizedBox(height: 20),

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
            controller: myController1,
            //autofocus: true,
            decoration: InputDecoration(hintText: "Input your name"),
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
            controller: myController2,
            //autofocus: true,
            decoration: InputDecoration(hintText: "Input your Bio"),
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
        SizedBox(height: 20),

        /// 性别选择项
        GenderDemo(),
        SizedBox(height: 20),

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
        SizedBox(height: 20),

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
        SizedBox(height: 10),

        /// 输入框
        AboutDemo(),
      ],
    );
  }
}

/// 背景图
class BackgroundImageAndAvatar extends StatefulWidget {
  const BackgroundImageAndAvatar({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BackgroundImageAndAvatarState();
  }
}

class BackgroundImageAndAvatarState extends State<BackgroundImageAndAvatar> {
  final picker = ImagePicker();
  late File _imaPath;

  Future getImage() async{
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    _imaPath = File(pickedFile?.path as String);
    print(_imaPath.path);
    setState(() {
      userUtil.avatar = _imaPath.path;
    });
  }

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
            child: Image.asset("assets/images/bg.jpg"),
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
                            getImage();
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
              child: CircleAvatar(
                radius: 70,
                backgroundImage: FileImage(File(userUtil.avatar)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// 性别设置
class GenderDemo extends StatefulWidget {
  const GenderDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GenderState();
  }
}

class GenderState extends State<GenderDemo> {
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
            selected: userNow.gender.compareTo("Male") == 0 ? true : false,
            onSelected: (value) {
              setState(() {
                userNow.gender = "Male";
              });
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
            selected: userNow.gender.compareTo("Female") == 0 ? true : false,
            onSelected: (value) {
              setState(() {
                userNow.gender = "Female";
              });
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
            selected:
            userNow.gender.compareTo("Not Specified") == 0 ? true : false,
            onSelected: (value) {
              setState(() {
                userNow.gender = "Not Specified";
              });
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

/// 生日设置
class BirthDemo extends StatefulWidget {
  const BirthDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BirthState();
  }
}

class BirthState extends State<BirthDemo> {
  @override
  Widget build(BuildContext context) {
    DateTime birth = userNow.birth;
    int year = birth.year;
    int month = birth.month;
    int day = birth.day;
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
                    maxTime: DateTime.now(), onChanged: (date) {
                  setState(() {
                    userNow.birth = date;
                  });
                }, onConfirm: (date) {
                  setState(() {
                    userNow.birth = date;
                  });
                }, currentTime: birth, locale: LocaleType.zh);
              },
              child: SizedBox(
                width: double.maxFinite,
                child: Text(
                  "$day-$month-$year",
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

/// 个人简介设置
class AboutDemo extends StatefulWidget {
  const AboutDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AboutState();
  }
}

class AboutState extends State<AboutDemo> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextField(
          controller: myController3,
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
