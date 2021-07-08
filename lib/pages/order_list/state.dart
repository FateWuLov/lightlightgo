import 'package:lifeaste/models/orderModel.dart';

class OrderListState {

  String dataListGID = 'dataListGID';

  bool loadFinished = false;
  List<OrderInfoModel> dataList = [];

  OrderListState() {
    ///Initialize variables
  }
}
