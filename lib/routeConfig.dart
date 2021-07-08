import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lifeaste/pages/debug_tools/view.dart';
import 'package:lifeaste/pages/root_page/view.dart';
import 'package:lifeaste/pages/user_profile/view.dart';

class RouteConfig {
  ///主页面
  static final String root = "/";
  static final String dialog = "/dialog";

  /// 用户主页
  static final String user = "/user";
  static final String login = "/login";
  /// 增值服务搜索
  static final String premiumSearch = "/premiumSearch";
  static final String starSearch = "/starSearch";

  static final String myFavoriteList = "/myFavoriteList";
  static final String enterInviteCode = "/enterInviteCode";
  static final String editUserInfo = "/editUserInfo";
  static final String allStar = "/allStar";
  static final String queryType = "/queryType";
  static final String inviteFriends = "/inviteFriends";
  static final String notifySetting = "/notifySetting";
  static final String videoPreview = "/videoPreview";
  static final String imChat = "/imChat";
  static final String jsWeb = "/jsWeb";
  static final String categoryStars = "/categoryStars";
  static final String debugTools = "/debugTools";
  static final String awaitTextCall = "/awaitTextCall";
  static final String awaitAgoraCall = "/awaitAgoraCall";
  static final String textCall = "/textCall";
  static final String agoraCall = "/agoraCall";
  static final String callResult = "/callResult";

  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: root, page: () => RootPage()),
    GetPage(name: user, page: () => UserProfilePage()),
    GetPage(name: debugTools, page: () => DebugToolsPage()),
  ];
}