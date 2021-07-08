import 'package:get/get.dart';

const int TabIndexStarList = 0;
const int TabIndexPremiumList = 1;
const int TabIndexOrderList = 2;
const int TabIndexTarot = 3;
const int TabIndexMyInfo = 4;

class HomeState {

  int pageCount = 0;

  int unreadMsgCount = 0;
  bool hasUnreadOrder = false;

  RxInt index = TabIndexStarList.obs;

  RxBool unread = false.obs;

  HomeState();
}
