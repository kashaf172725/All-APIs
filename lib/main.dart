import 'package:flutter/material.dart';
import 'package:flutter_application_1/API_screens/controller/provider/PlaylistProvider.dart';
import 'package:flutter_application_1/API_screens/controller/provider/Signup_provider.dart';
import 'package:provider/provider.dart';
import 'API_screens/controller/provider/Login_provider.dart';
import 'API_screens/view/homeScreen.dart';
import 'API_screens/view/splash.dart';
import 'API_screens/view/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return
     MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => loginProvider()),
        ChangeNotifierProvider(create: (context) => PlaylistProvider()),
       ChangeNotifierProvider(create: (context) => signupProvider()),
      ],
      child: MaterialApp(
       
         theme: ThemeData(primarySwatch: Colors.grey,),
      
        // home: SplashPage(),
           home:Test(),
      
      ),
    );
  }
}

/*
"email":"arham@eygpttv.com",
"password":"12345678"


endpoints
manager
provider
main: multiprovider
model made
attach model
view : initstate + builder + place name in view from provider

*/