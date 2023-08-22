


import 'package:flutter/cupertino.dart';

pushUntil(context, screen){
  Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=> screen ), (route) => false);
}

