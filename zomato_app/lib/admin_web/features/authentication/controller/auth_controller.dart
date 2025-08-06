import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zomato_app/admin_web/features/authentication/model/auth_model.dart';
import 'package:zomato_app/admin_web/features/homepage/homepage.dart';
import 'package:zomato_app/common_widgets/common_toast_message.dart';
import 'package:zomato_app/network/api_service.dart';
import 'package:zomato_app/network/token_service.dart';

class AdminAuthScreenController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLogin = true.obs;
  RxBool loader = false.obs;

  void onClickSubmit(BuildContext context) async {
    if (isLogin.value) {
      if (emailController.text.trim() == "" ||
          passwordController.text.trim() == "") {
        ToastUtil.showError(context, "Please enter email and password");
        return;
      }

      try {
        loader.value = true;
        update();
        final payload = {
          'email': emailController.text,
          'password': passwordController.text,
        };

        final response = await ApiService.post('/auth/login', payload);

        if (response?.statusCode == 200) {
          final authResponse = AuthResponse.fromJson(response?.data);
          print('Login Success: ${authResponse.token} ${authResponse.user}');
          await TokenService.saveToken(authResponse.token);
          ToastUtil.showSuccess(context, "Login successful");
          Get.offAll(() => Homepage());
        }
      } on DioException catch (err) {
        ToastUtil.showError(
          context,
          err.response?.data['message'] ?? "Something went wrong",
        );
      } finally {
        loader.value = false;
        update();
      }
    } else {
      if (nameController.text.trim() == "" ||
          emailController.text.trim() == "" ||
          passwordController.text.trim() == "") {
        ToastUtil.showError(context, "Please enter name, email and password");
        return;
      }

      try {
        loader.value = true;
        update();
        final payload = {
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'role': "admin",
        };

        final response = await ApiService.post('/auth/register', payload);

        if (response?.statusCode == 201) {
          ToastUtil.showSuccess(context, "Register successful");
          isLogin.value = true;
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          update();
        }
      } on DioException catch (err) {
        ToastUtil.showError(
          context,
          err.response?.data['message'] ?? "Something went wrong",
        );
      } finally {
        loader.value = false;
        update();
      }
    }
  }

  void toggleLoginSignup() {
    isLogin.value = !isLogin.value;
    update();
  }
}
