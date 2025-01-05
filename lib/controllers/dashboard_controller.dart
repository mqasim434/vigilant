import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxInt currentPage = 0.obs;
  final RxString selectedLabel = 'Home'.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPage.value);
  }

  void changePage(int index) {
    currentPage.value = index;
    pageController.jumpToPage(index); // Update the PageView
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void changeSelectedLabel(String label) {
    selectedLabel.value = label;
    int index = _getIndexFromLabel(label);
    currentPage.value = index;
    pageController.jumpToPage(index);
  }

  String _getLabelFromIndex(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Map";
      case 2:
        return "Inbox";
      case 3:
        return "Profile";
      default:
        return "Home";
    }
  }

  int _getIndexFromLabel(String label) {
    switch (label) {
      case "Home":
        return 0;
      case "Map":
        return 1;
      case "Inbox":
        return 2;
      case "Profile":
        return 3;
      default:
        return 0;
    }
  }
}
