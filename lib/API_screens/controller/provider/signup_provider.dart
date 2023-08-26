

import 'package:flutter/material.dart';
import 'package:flutter_application_1/API_screens/controller/service/api_manager.dart';
import 'package:flutter_application_1/API_screens/view/homeScreen.dart';
import 'package:flutter_application_1/API_screens/view/login_screen.dart';
import 'package:flutter_application_1/utils/prefrences.dart';
import '../../model/Signup_model.dart';
import '../../widgets.dart';

class signupProvider extends ChangeNotifier {
  bool isloading = false;
  signup(context, {email, password,name}) async {
    isloading = true;
    notifyListeners();
    if (email.isEmpty) {
      showSnack(context, "please enter email");
    } else if (password.isEmpty) {
      showSnack(context, "please enter password");
    }
    else{
     var body = { "email": email,"name": name, "password": password};
    Signupmodel res = await APIManager.sinup(context, body);
    if (res.statusCode == 200) {
      Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) =>LoginScreen ()), (route) => false);    }
    
    
    }
    isloading = false;
    notifyListeners();
    }

  }

