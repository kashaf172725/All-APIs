import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/API_screens/view/homeScreen.dart';
import '../../utils/const.dart';
import '../../utils/prefrences.dart';
import '../../utils/uttils.dart';
import 'images.dart';
import 'login_screen.dart';



class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTimer() async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async{
    var token = await Preference.getToken();
    if (token != null) {
         pushUntil(context, HomeScreen());
    }else{

         pushUntil(context, LoginScreen());
    }
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyColors.white,
        child: Center(
          child: Logo.logo,
          ),
        ),
      );
    
  }
}
