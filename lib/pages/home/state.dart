import 'package:get/get.dart';

const int TabIndexStarList = 0;
const int TabIndexOrderList = 1;
const int TabIndexMyInfo = 2;

class HomeState {

  int pageCount = 0;

  int unreadMsgCount = 0;
  bool hasUnreadOrder = false;

  RxInt index = TabIndexStarList.obs;

  RxBool unread = false.obs;

  HomeState();
}
