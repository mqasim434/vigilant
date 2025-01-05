import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigilant/controllers/auth_controller.dart';
import 'package:vigilant/utils/constants/my_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            tileColor: MyColors.deepPurpleColor,
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              "Welcome ${authController.currentUser!.name}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            subtitle: const Row(
              children: [
                const Icon(
                  Icons.location_pin,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  'Live Location',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            trailing: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          Container(
            width: screenWidth,
            height: screenHeight * 0.2,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: MyColors.lightPinkColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Emergency\nAlert',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.35,
                      height: screenHeight * 0.2,
                      decoration: BoxDecoration(
                        color: MyColors.deepPurpleColor,
                        borderRadius: BorderRadius.circular(
                          500,
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: MyColors.darkPinkColor,
                        borderRadius: BorderRadius.circular(
                          500,
                        ),
                      ),
                      child: Icon(
                        Icons.warning,
                        size: 40,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
