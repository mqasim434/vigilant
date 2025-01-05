import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vigilant/data/remote/auth_repository.dart';
import 'package:vigilant/models/user_model.dart';
import 'package:vigilant/views/dashboard/dashboard.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final Rxn<UserModel> _currentUser = Rxn<UserModel>();

  UserModel? get currentUser => _currentUser.value;

  void signUp() async {
    try {
      final user = await _authRepository.signUp(
        nameController.text.trim(),
        emailController.text.trim(),
        phoneController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        _currentUser.value = user;
        Get.snackbar('Success', 'Sign up successful!',
            backgroundColor: Colors.green);
        nameController.clear();
        emailController.clear();
        phoneController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        Get.to(()=>Dashboard());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red);
    }
  }

  void signIn() async {
    try {
      final user = await _authRepository.signIn(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        _currentUser.value = user;
        Get.snackbar('Success', 'Sign in successful!',
            backgroundColor: Colors.green);
            emailController.clear();
        passwordController.clear();
        Get.to(()=>Dashboard());
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red);
    }
  }

  void signOut() async {
    try {
      await _authRepository.signOut();
      _currentUser.value = null;
      Get.snackbar('Success', 'Signed out successfully!',
          backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red);
    }
  }

  void forgotPassword() async {
    try {
      await _authRepository.forgotPassword(emailController.text.trim());
      Get.snackbar('Success', 'Password reset email sent!',
          backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red);
    }
  }

  void changePassword(String newPassword) async {
    try {
      await _authRepository.changePassword(newPassword);
      Get.snackbar('Success', 'Password changed successfully!',
          backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red);
    }
  }
}
