import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zomato_app/admin_web/features/authentication/auth.dart';
import 'package:zomato_app/admin_web/features/homepage/homepage.dart';
import 'package:zomato_app/network/token_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> checkAuth() async {
    final token = await TokenService.getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zomato Admin',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: checkAuth(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data == true) {
            return const Homepage();
          } else {
            return AdminAuthScreen();
          }
        },
      ),
    );
  }
}
