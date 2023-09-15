import 'package:flutter/material.dart';

import '../Model/themdata.dart';

class themeprovider extends ChangeNotifier {
  Thememodel theme = Thememodel(isdark: true);
  void changetheme() {
    theme.isdark = !theme.isdark;
    notifyListeners();
  }
}
