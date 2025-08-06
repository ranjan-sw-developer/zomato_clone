import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zomato_app/admin_web/features/authentication/controller/auth_controller.dart';
import 'package:zomato_app/common_widgets/image_slider.dart';
import 'package:zomato_app/common_widgets/common_red_button.dart';
import 'package:zomato_app/common_widgets/common_textInput.dart';
import 'package:zomato_app/constants/app_strings.dart';

class AdminAuthScreen extends StatelessWidget {
  final AdminAuthScreenController authController = Get.put(
    AdminAuthScreenController(),
  );

  AdminAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 150,
                    horizontal: 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authController.isLogin.value
                            ? AppStrings.login
                            : AppStrings.register,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                        visible: !authController.isLogin.value,
                        child: CommonTextInput(
                          fieldName: AppStrings.name,
                          controller: authController.nameController,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CommonTextInput(
                        fieldName: AppStrings.email,
                        controller: authController.emailController,
                      ),
                      const SizedBox(height: 20),
                      CommonTextInput(
                        fieldName: AppStrings.password,
                        controller: authController.passwordController,
                      ),
                      const SizedBox(height: 40),
                      CommonRedButton(
                        buttonLabel: authController.isLogin.value
                            ? AppStrings.login
                            : AppStrings.register,
                        onPressed: () => authController.onClickSubmit(context),
                        isLoading: authController.loader.value,
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: authController.isLogin.value
                                    ? AppStrings.newUsers
                                    : AppStrings.alreadyRegistered,
                              ),
                              TextSpan(
                                text: authController.isLogin.value
                                    ? AppStrings.register
                                    : AppStrings.login,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    authController.toggleLoginSignup();
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: ImageSlider()),
            ],
          ),
        ),
      ),
    );
  }
}
