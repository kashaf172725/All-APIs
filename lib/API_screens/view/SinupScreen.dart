import 'package:flutter/material.dart';
import 'package:flutter_application_1/API_screens/controller/provider/Signup_provider.dart';
import 'package:provider/provider.dart';
import '../../utils/const.dart';
import '../widgets.dart';

class SinUpScreen extends StatefulWidget {
  const SinUpScreen({super.key});

  @override
  State<SinUpScreen> createState() => _SinUpScreenState();
}

class _SinUpScreenState extends State<SinUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        var myprovider = context.watch<signupProvider>();
        return myprovider.isloading
            ? Center(child: CircularProgressIndicator())
            : Container(
                height: double.infinity,
                width: double.infinity,
                color: MyColors.lighe_blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios)),
                    Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: "SIGNUP SCREEN",
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                              color: MyColors.blue),
                          box("E-mail", email),
                          box('Password', password, isObsecure: true),
                          CustomButton(
                              text: "Next",
                              height: 40,
                              color: MyColors.dark_blue,
                              fontcolor: MyColors.lighe_blue,
                              onPressed: () {
                                var provider = context.read<signupProvider>();
                                provider.signup(context,
                                    email: email.text, password: password.text);
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
