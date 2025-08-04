import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:zomato_app/common_widgets/common_toast_message.dart';
import 'package:zomato_app/network/api_service.dart';

class AdminAuthScreenController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLogin = true.obs;
  RxBool loader = false.obs;

  void onClickSubmit(BuildContext context) async {
    print(
      "check values ==> ${nameController.text} ${emailController.text} ${passwordController.text}",
    );
    loader.value = true;
    update();
    if (isLogin.value) {
      if (emailController.text.trim() == "" ||
          passwordController.text.trim() == "") {
        ToastUtil.showError(context, "Please enter email and password");
        return;
      }

      try {
        final payload = {
          'email': emailController.text,
          'password': passwordController.text,
        };

        final response = await ApiService.post('/auth/login', payload);

        if (response?.statusCode == 200) {
          print('Login Success: ${response!.data}');
          ToastUtil.showSuccess(context, "Login successful");
        }
      } catch (err) {
        ToastUtil.showError(context, "Something went wrong");
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
        final payload = {
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'role': "admin",
        };

        final response = await ApiService.post('/auth/register', payload);

        if (response?.statusCode == 200) {
          print('Login Success: ${response!.data}');
          ToastUtil.showSuccess(context, "Register successful");
          isLogin.value = false;
          update();
        }
      } catch (err) {
        ToastUtil.showError(context, "Something went wrong");
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
