import 'package:find_my_zawj/database/preferences.dart';
import 'package:find_my_zawj/extention/navigator.dart';
import 'package:find_my_zawj/homepage.dart';
import 'package:find_my_zawj/view/login.dart';
import 'package:find_my_zawj/view/pengguna_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  void autoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    bool? data = await PreferenceHandler.getIsLogin();
    print("halo bening");
    if (data == true) {
      context.pushAndRemoveAll(PenggunaScreen());
    } else {
      context.pushAndRemoveAll(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('assets/icons/zawj.png')],
      ),
    );
  }
}
