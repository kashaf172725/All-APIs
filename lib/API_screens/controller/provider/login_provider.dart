

import 'package:flutter/material.dart';
import 'package:flutter_application_1/API_screens/controller/service/api_manager.dart';
import 'package:flutter_application_1/API_screens/model/Login_model.dart';
import 'package:flutter_application_1/API_screens/view/homeScreen.dart';
import 'package:flutter_application_1/utils/prefrences.dart';
import '../../widgets.dart';

class loginProvider extends ChangeNotifier {
  bool isloading = false;
  login(context, {email, password}) async {
    if (email.isEmpty) {
      showSnack(context, "please enter email");
    } else if (password.isEmpty) {
      showSnack(context, "please enter password");
    }
    else{
    isloading = true;
    notifyListeners();
    Loginmodel? res = await APIManager.login(context, email: email, password: password);
    print(res);
    if (res!.data != null) {
      Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) =>HomeScreen ()), (route) => false);    }
    if(res.data!= null){
     await Preference.savetoken(res.data!.accessToken);
 
    }
    isloading = false;
    notifyListeners();
    }

  }
}
