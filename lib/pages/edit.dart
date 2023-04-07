import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hive/hive.dart';
import 'package:myapp/common/decoration.dart';
import '../models/usermodel.dart';

class FMEditVC extends StatefulWidget {
  const FMEditVC({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FMEditVCState();
  }
}

class FMEditVCState extends State<FMEditVC> {
  Box box = Hive.box("userBox");
  @override
  Widget build(BuildContext context) {
    User user = User(box.get("name"), box.get("bio"), box.get("gender"), box.get("birth"), box.get("about"), box.get("avatar"), box.get("likedList"));
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: EditAppbar(user: user),
      backgroundColor: Colors.white,
      body: EditBody(user: user),
    );
  }
}

class EditAppbar extends StatelessWidget implements PreferredSizeWidget {
  const EditAppbar({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
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
            Box box = Hive.box("userBox");
            box.put("name", user.name);
            box.put("bio", user.bio);
            box.put("gender", user.gender);
            box.put("avatar", user.avatar);
            box.put("about", user.about);
            box.put("likedList", user.likedList);
            box.put("birth", user.birth);
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
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(40);
}

class EditBody extends StatelessWidget {
  const EditBody({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){ FocusScope.of(context).requestFocus(FocusNode());},
      child: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 90,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Column(
                    children: [
                      const BackgroundImage(),
                      const SizedBox(height: 70),
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
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: double.maxFinite,
                        height: 80,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: TextField(
                            autofocus: true,
                            decoration: InputDecoration(hintText: user.name),
                          ),
                        ),
                      ),
                      /// 文本 bio
                      Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.only(left: 20),
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
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: double.maxFinite,
                        height: 80,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: TextField(
                            autofocus: true,
                            decoration: InputDecoration(hintText: user.bio),
                          ),
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
                      GenderDemo(user: user),
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
                      BirthDemo(user: user,),
                      const SizedBox(height: 20),
                      /// 文本 about me
                      Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.only(left: 20),
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
                      AboutDemo(user: user,),
                    ],
                  ),
                ),

                /// 头像
                Positioned(
                  top: 80,
                  child: TextButton(
                    onPressed: () {
                      /// 这里写点击头像后打开相册更换头像的逻辑
                      ///
                    },
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(user.avatar),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

/// 背景图
class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const SizedBox(
      width: double.maxFinite,
      height: 150,
      child: Image(
        image: AssetImage("assets/images/bg.jpg"),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

/// 性别设置
class GenderDemo extends StatefulWidget {
  const GenderDemo({super.key, required this.user});

  final User user;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GenderState(user);
  }
}
class GenderState extends State<GenderDemo> {
  late final User user;
  GenderState(this.user);
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
            selected: user.gender.compareTo("Male") == 0 ? true : false,
            onSelected: (value) {
              setState(() {
                user.gender = "Male";
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
            selected: user.gender.compareTo("Female") == 0 ? true : false,
            onSelected: (value) {
              setState(() {
                user.gender = "Female";
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
                user.gender.compareTo("Not Specified") == 0 ? true : false,
            onSelected: (value) {
              setState(() {
                user.gender = "Not Specified";
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
  const BirthDemo({super.key, required this.user});

  final User user;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BirthState(user);
  }
}
class BirthState extends State<BirthDemo> {
  User user;
  BirthState(this.user);
  @override
  Widget build(BuildContext context) {
    DateTime birth = user.birth;
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
                    birth = date;
                  });
                }, onConfirm: (date) {
                  setState(() {
                    user.birth = date;
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
  const AboutDemo({super.key, required this.user});

  final User user;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AboutState(user);
  }
}
class AboutState extends State<AboutDemo> {
  User user;
  AboutState(this.user);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 120,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'About Me',
            filled: true,
            fillColor: Colors.grey.shade300,
            //isCollapsed: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //isDense: true,
            border: const OutlineInputBorder(
              gapPadding: 0,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              //borderSide: BorderSide(width: 1, style: BorderStyle.none,),
            ),
          ),
          onChanged: (text) {
            user.about = text;
          },
        ),
      ),
    );
  }
}
