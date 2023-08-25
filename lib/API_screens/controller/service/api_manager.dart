import 'dart:convert';
import 'package:flutter_application_1/API_screens/widgets.dart';
import 'package:http/http.dart' as http;
import '../../model/signup-model.dart';
import 'end_points.dart';

class APIManager {
  
  static login(context,{email, password}) async {
  
    try {
      var url = Uri.parse(BASE_URL + login_endpoint);
      var responce =
      await http.post(url, body: {"email": email, "password": password});
      var res = jsonDecode(responce.body);
      showSnack(context, res["message"],isSuccess: true);
      print(responce.body);
      return login_model.fromJson(res);
    } catch (e) {
    showSnack(context, e.toString());
    }
    
  }

  static getplaylist(context)async{

    try{
      var url = Uri.parse(BASE_URL + playlist_endpoint);
      var responce= await  http.get(url);
      var res = jsonDecode(responce.body);
      showSnack(context, res["message"],isSuccess: true);
      return getplaylist_model.fromJson(res);
    }catch(e)
    {
  showSnack(context, e.toString());
    }
  }

  static addplaylist(context,name)async{
  try{
    var url = Uri.parse(BASE_URL +addnewplaylist_endpoint);
   var responce= await http.post(url,body: {"name": name});
       var res = jsonDecode(responce.body);
        showSnack(context, res["message"],isSuccess: true);
     
      return addplaylist_model.fromJson(res);
    }catch(e){
      showSnack(context, e.toString);

  }
}

  static delplaylist(context,id)async{
  try{
    var url = Uri.parse(BASE_URL + delpleylist_endpoint + id);
   var responce= await http.delete(url);
       var res = jsonDecode(responce.body);
        showSnack(context, res["message"],isSuccess: true);
     
      return delete_model.fromJson(res);
    }catch(e){
      showSnack(context, e.toString);

  }
}

  static update_playlist(context,body,id)async{
    try{
      var url = Uri.parse(BASE_URL + updatePlayListEndpoint + id);
      var responce = await http.patch(url,body: {"name":body});
      var res = jsonDecode(responce.body);
      showSnack(context, res["message"],isSuccess: true);
      print(responce.body);
      return update_model.fromJson(res);
    } catch (e) {
    showSnack(context, e.toString());
   
  }

}

  static sinup(context,body) async {
  
    try {
      var url = Uri.parse(BASE_URL + sinup_endpoint);
      var responce =
          await http.post(url, body: body);
      var res = jsonDecode(responce.body);
      showSnack(context, res["message"],isSuccess: true);
      print(responce.body);
      return Signup_model.fromJson(res);
    } catch (e) {
    showSnack(context, e.toString());
    }
    
  }
 
}

