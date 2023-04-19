import 'package:get/get.dart';

const int TabIndexAdvisorList = 0;
const int TabIndexOrderList = 1;
const int TabIndexMyInfo = 2;

class HomeState {
  int pageCount = 0;

  RxInt index = TabIndexAdvisorList.obs;

  HomeState();
}