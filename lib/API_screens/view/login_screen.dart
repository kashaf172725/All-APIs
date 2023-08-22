import 'package:flutter/material.dart';
import 'package:flutter_application_1/API_screens/controller/provider/login_provider.dart';
import 'package:flutter_application_1/utils/const.dart';
import 'package:provider/provider.dart';
import '../widgets.dart';
import 'SinupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return 
       Scaffold(
          
          appBar: AppBar(
            backgroundColor: MyColors.dark_blue,
            centerTitle: true,
            title: CustomText(
                text: "API login screen ",
                fontWeight: FontWeight.bold,
                color: MyColors.white),
          ),
          body: Builder(
            builder: (context) {
               var myprovider= context.watch<loginProvider>();
       return myprovider.isloading ? Center(child: CircularProgressIndicator())
        :
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: MyColors.dark_blue,
                    child: Center(
                      child: CustomText(
                          text: "WELCOME TO API LOGIN SCREEN",
                          fontSize: size.width > 540 ? 30 : 15,
                          fontWeight: FontWeight.w900,
                          color: MyColors.blue),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width * 0.7,
                    color: MyColors.lighe_blue,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            text: "LOGIN SCREEN",
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            color: MyColors.blue),
                        box("E-mail", email),
                        box('Password', password, isObsecure: true),
                        CustomButton(
                            text: "Next",
                            height: 40,
                            color: MyColors.dark_blue,
                            color1: MyColors.lighe_blue,
                            onPressed: () {
                            
                          var provider= context.read<loginProvider>();
                          provider.login(context,
                         email:email.text,  password: password.text
                          );
                              
                            }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(text: "already have an account"),
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SinUpScreen()));
                                }, child:  CustomText(text: "Sin UP"),)
                              ],
                            ),
                      ],
                    )),
                  ),
                ],
              );
            }
          ),
        );
      
    
  }
}
