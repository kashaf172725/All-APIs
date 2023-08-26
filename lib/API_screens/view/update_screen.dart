

import 'package:flutter/material.dart';
import 'package:flutter_application_1/API_screens/controller/provider/PlaylistProvider.dart';
import 'package:provider/provider.dart';
import '../../utils/const.dart';
import '../widgets.dart';

class UpdateScreen extends StatefulWidget {
  final data;
 UpdateScreen(this.data);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
   final updatecontroller = TextEditingController();
   @override
  void initState() {
    getplaylistfunc();
    super.initState();
  }
   getplaylistfunc() {

    updatecontroller.text = widget.data!.name;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColors.backgroundcolor,
      body:   Center(
        child: Container(
                margin: EdgeInsets.all(15),
                height: 200,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  CustomText( text:"Update Playlist",
                 fontSize: 15,fontWeight: FontWeight.bold),
                   CustomText(text: widget.data.name),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12.0),
                    child: TextField(
                      controller: updatecontroller,
                      decoration: InputDecoration( 
                      labelText: "Enter playlist name"),),
                  ),
                  
              Builder(
                builder: (context) {
                  var block = context.watch<PlaylistProvider>();
                return  block.isloading ? CircularProgressIndicator() : 
                   InkWell(
                  
                        onTap: ()async{
                    var provider = context.read<PlaylistProvider>();
                   await provider.updatePlaylistprovider(context, updatecontroller.text,widget.data.id);
                        },
                        child: Container(
                                      decoration: BoxDecoration(
                                          color: MyColors.white,
                                          borderRadius: BorderRadius.circular(12)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const [
                                            Icon(
                                              Icons.add,
                                              color: MyColors.black,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Update Playlist",
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                      );
                }
              ),
               ]),
                decoration: BoxDecoration(
                    color: MyColors.backgroundcolor,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                          color: MyColors.grey,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0),
                      BoxShadow(
                          color: MyColors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ]),
              ),
      )
    );
 
  }
}