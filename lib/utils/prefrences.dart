


  import 'package:shared_preferences/shared_preferences.dart';

class Preference{
   static  String  tokenkey = "token";
  static savetoken(token)async{
    try{

    var pref = await SharedPreferences.getInstance();
    pref.setString(tokenkey, token);
    return true;
    }
    catch(e){
      return false;

    }
  }

static getToken()async{

 
    var pref = await SharedPreferences.getInstance();
   var data =  pref.getString( tokenkey);
   if(data !=null)
   {
    return data;
   }
} }