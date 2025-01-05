import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigilant/controllers/dashboard_controller.dart';
import 'package:vigilant/components/bottom_navbar.dart';
import 'package:vigilant/views/dashboard/home_screen.dart';
import 'package:vigilant/views/dashboard/map_screen.dart';
import 'package:vigilant/views/dashboard/inbox_screen.dart';
import 'package:vigilant/views/dashboard/profile_screen.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final DashboardController dashboardController =
      Get.put(DashboardController());

  final List<Widget> pages = const [
    HomeScreen(),
    MapScreen(),
    InboxScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: dashboardController.pageController,
        onPageChanged: (index) => dashboardController.currentPage.value = index,
        children: pages,
      ),
      bottomNavigationBar: const MyNavBar(),
    );
  }
}
