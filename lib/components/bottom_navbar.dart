import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigilant/controllers/dashboard_controller.dart';
import 'package:vigilant/utils/constants/my_colors.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();

    final navItems = [
      {"label": "Home", "icon": Icons.home},
      {"label": "Map", "icon": Icons.location_pin},
      {"label": "Inbox", "icon": Icons.inbox},
      {"label": "Profile", "icon": Icons.person},
    ];

    return Obx(() => Container(
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 20),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navItems.length, (index) {
              final isSelected = dashboardController.currentPage.value == index;
              return InkWell(
                onTap: () => dashboardController.changePage(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      navItems[index]["icon"] as IconData,
                      color:
                          isSelected ? MyColors.deepPurpleColor : Colors.grey,
                    ),
                    Text(
                      navItems[index]["label"] as String,
                      style: TextStyle(
                        color:
                            isSelected ? MyColors.deepPurpleColor : Colors.grey,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? MyColors.lightPinkColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ));
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.label,
    required this.activeIcon,
    required this.inActiveIcon,
    required this.onTap,
  });

  final String? label;
  final IconData? activeIcon;
  final IconData? inActiveIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Obx(() {
      bool isSelected = controller.selectedLabel.value == label;
      return InkWell(
        onTap: () {
          controller.changeSelectedLabel(label.toString());
          onTap.call();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : inActiveIcon,
              color: isSelected ? MyColors.deepPurpleColor : Colors.grey,
            ),
            Text(
              label.toString(),
              style: TextStyle(
                color: isSelected ? MyColors.deepPurpleColor : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color:
                    isSelected ? MyColors.lightPinkColor : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
      );
    });
  }
}
