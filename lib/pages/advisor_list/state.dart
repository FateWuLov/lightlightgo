import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../models/advisormodel.dart';

class AdvisorListState {
  String advisorListGID = 'advisorListGID';

  List<Advisor> advisorList = [];

  RefreshController refreshController = RefreshController();

  AdvisorListState();
}