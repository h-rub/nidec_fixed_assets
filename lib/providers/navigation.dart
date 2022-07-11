import 'package:flutter/material.dart';

class NavigationInfo with ChangeNotifier {
  int _currentPage = 0;
  final PageController _pageController = new PageController(initialPage: 0);

  int get currentPage {
    return _currentPage;
  }

  set currentPage(int index) {
    _currentPage = index;
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
