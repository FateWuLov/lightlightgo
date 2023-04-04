import 'package:flutter/foundation.dart';
import 'package:myapp/models/advisorlistmodel.dart';

/// 顾问页model

class AdvisorModel extends ChangeNotifier {
  late AdvisorListModel _advisorList;

  final List<int> likedList = [];

  AdvisorListModel get advisorList => _advisorList;

  set advisorList(AdvisorListModel newList) {
    _advisorList = newList;
    notifyListeners();
  }

  List<Advisor> get advisors => likedList.map((id) => _advisorList.getById(id)).toList();

  /// 收藏顾问则把顾问id加入到likedList
  void setLikeState(int id) {
    /*if(likedList.contains(advisor.id)) {
      likedList.remove(advisor.id);
    } else{
      likedList.add(advisor.id);
    }*/
    likedList.contains(id) ? likedList.remove(id): likedList.add(id);
    notifyListeners();
  }
}