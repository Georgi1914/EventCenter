import 'package:flutter/cupertino.dart';

import '../../global_variables.dart';

class NavBarVM extends ChangeNotifier {
  PageEnum selectedPage = PageEnum.home;

  void changeSelectedPage(PageEnum page) {
    if (selectedPage != page) {
      selectedPage = page;
      notifyListeners();
    }
  }
}
