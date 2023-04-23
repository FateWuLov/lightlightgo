
import 'package:flutter/cupertino.dart';

import '../../models/advisormodel.dart';
import '../../models/usermodel.dart';

class CreateOrderState {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  late final Advisor advisor;
  late final User user;
}