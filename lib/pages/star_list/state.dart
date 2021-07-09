

import 'package:lifeaste/models/userModel.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum StarCategory { bestMatch, recentViewed, staffPick, live, new_ }

const int StarSortType_Default = 0;
const int StarSortType_MostReading = 1;
const int StarSortType_MostReviews = 2;
const int StarSortType_TopRated = 3;
const int StarSortType_MostAccuracy = 4;
const List<String> StarSortStrs = ['', 'order_completed', 'comment_count', 'rate', 'accuracy'];


class StarListState {
  String dataListGID = 'dataListGID';

  List<UserInfoModel> dataList = [];

  int nextPage = 0;
  RefreshController refreshController = RefreshController();

  StarListState() {
    ///Initialize variables
  }
}
