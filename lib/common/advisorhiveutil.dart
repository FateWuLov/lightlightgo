import 'package:hive/hive.dart';
import 'package:myapp/models/advisormodel.dart';

class AdvisorHiveUtil {
  late Box box;

  _addAdvisor(Advisor advisor) async {
    // Add info to people box
    box.add(advisor);
  }

  _getAdvisor() async {
    // Get info from people box
    box.getAt(0);
  }

  _updateAdvisor(Advisor advisor) async {
    // Update info of people box
    _deleteAdvisor();
    _addAdvisor(advisor);
  }

  _deleteAdvisor() async {
    // Delete info from people box
    box.deleteAt(0);
  }
}