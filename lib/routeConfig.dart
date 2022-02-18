import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lifeaste/pages/debug_tools/view.dart';
import 'package:lifeaste/pages/order_detail/view.dart';
import 'package:lifeaste/pages/root_page/view.dart';
import 'package:lifeaste/pages/user_profile/view.dart';

class RouteConfig {
  ///主页面
  static final String root = "/";
  static final String dialog = "/dialog";

  /// 用户主页
  static final String user = "/user";
  static final String orderDetail = "/orderDetail";
  static final String debugTools = "/debugTools";

  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: root, page: () => RootPage()),
    GetPage(name: user, page: () => UserProfilePage()),
    GetPage(name: debugTools, page: () => DebugToolsPage()),
    GetPage(name: orderDetail, page: () => OrderDetailPage()),
  ];
}