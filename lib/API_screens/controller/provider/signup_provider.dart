

import 'package:flutter/material.dart';
import 'package:flutter_application_1/API_screens/controller/service/api_manager.dart';
import 'package:flutter_application_1/API_screens/view/homeScreen.dart';
import 'package:flutter_application_1/utils/prefrences.dart';
import '../../widgets.dart';

class signupProvider extends ChangeNotifier {
  bool isloading = false;
  signup(context, {email, password}) async {
    isloading = true;
    notifyListeners();
    if (email.isEmpty) {
      showSnack(context, "please enter email");
    } else if (password.isEmpty) {
      showSnack(context, "please enter password");
    }
    else{
     var body = { "email": email, "password": password};
    var res = await APIManager.sinup(context, body);
    if (res["data"] != null) {
      Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) =>HomeScreen ()), (route) => false);    }
    if(res["data" ]!= null){
     await Preference.savetoken(res["data"]["access_token"]);
    
    }
    isloading = false;
    notifyListeners();
    }

  }
}
