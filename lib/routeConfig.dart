import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:lifeaste_lt/pages/advisor_detail/view.dart';
import 'package:lifeaste_lt/pages/advisor_list/view.dart';
import 'package:lifeaste_lt/pages/create_order/view.dart';
import 'package:lifeaste_lt/pages/extension/view.dart';
import 'package:lifeaste_lt/pages/home/view.dart';
import 'package:lifeaste_lt/pages/user/view.dart';
import 'package:lifeaste_lt/pages/user_profile/view.dart';

class RouteConfig {
  /// 导航
  static const String root = "/";

  /// 主页
  static const String advisorList = "/advisor_list";

  /// 顾问详情页
  static const String advisorDetail = "/advisor_detail";

  /// 订单页
  static const String orderList = "/order_list";

  /// 下单页
  static const String createOrder = "/create_order";

  /// 用户主页
  static const String user = "/user";

  /// 编辑页
  static const String userProfile = "/user_profile";

  //
  static const String extension = "/extension";

  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: root, page: () => HomePage()),
    GetPage(name: advisorList, page: () => AdvisorListPage()),
    GetPage(name: advisorDetail, page: () => AdvisorDetailPage()),
    //GetPage(name: orderList, page: () => OrderListPage()),
    GetPage(name: createOrder, page: () => CreateOrderPage()),
    GetPage(name: user, page: () => UserPage()),
    GetPage(name: userProfile, page: () => UserProfilePage()),
    GetPage(name: extension, page: () => ExtensionPage())
  ];
}