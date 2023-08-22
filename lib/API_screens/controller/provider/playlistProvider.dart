import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/API_screens/controller/service/api_manager.dart';

class PlaylistProvider extends ChangeNotifier{
bool isloading = false;
var loading = false;
var load = false;
var loading1 = false;
var playlist;


getplaylistprovider(context,)async{
  isloading =true;
  notifyListeners();
  playlist = await APIManager.getplaylist(context,);
 isloading = false;
 notifyListeners();
}


addPlaylistprovider(context, name)async{
 loading =true;
  notifyListeners();
   await  APIManager.addplaylist(context, name);
   getplaylistprovider(context);
 loading = false;
 notifyListeners();
  Navigator.pop(context);
}


delPlaylistprovider(context, id)async{
 load =true;
  notifyListeners();
   await  APIManager.delplaylist(context,id);
   getplaylistprovider(context);
 load = false;
 notifyListeners();
}


updatePlaylistprovider(context, body,id)async{
 loading1 =true;
  notifyListeners();
   await  APIManager.update_playlist(context,body,id);
   getplaylistprovider(context);
 loading1 = false;
 notifyListeners();
   Navigator.pop(context);
}
}