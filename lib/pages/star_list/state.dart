

import 'package:lifeaste/models/userModel.dart';

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

  StarListState() {
    ///Initialize variables
  }
}
