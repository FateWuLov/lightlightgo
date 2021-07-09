import 'package:lifeaste/models/orderModel.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrderListState {

  String dataListGID = 'dataListGID';

  bool loadFinished = false;
  List<OrderInfoModel> dataList = [];

  int nextPage = 0;
  RefreshController refreshController = RefreshController();

  OrderListState() {
    ///Initialize variables
  }
}
