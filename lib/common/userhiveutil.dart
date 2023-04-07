import 'package:hive/hive.dart';
import '../models/usermodel.dart';

class UserHiveUtil {
  late Box box;

  _addUser(User user) async {
    // Add info to people box
    box.add(user);
  }

  _getUser() async {
    // Get info from people box
    box.getAt(0);
  }

  _updateUser(User user) async {
    // Update info of people box
    _deleteUser();
    _addUser(user);
  }

  _deleteUser() async {
    // Delete info from people box
    box.deleteAt(0);
  }
}