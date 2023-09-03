import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/API_screens/view/update_screen.dart';
import 'package:provider/provider.dart';

import '../../utils/const.dart';
import '../controller/provider/PlaylistProvider.dart';
import '../widgets.dart';
import 'createPlaylist.dart';



class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController title = TextEditingController();

  @override
  void initState() {
    getplaylistfunc();
    super.initState();
  }

  getplaylistfunc() {
    var provider = context.read<PlaylistProvider>();
    provider.getplaylistprovider(context);
  }



//create new task
  // void creatNewTask() {
  //   showDialog(
  //       context: context,
  //       builder: (
  //         context,
  //       ) {
  //         return DialogBox(controller: _controller, onSave: saveNewTask);
  //       });
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundcolor,

        floatingActionButton: FloatingActionButton(
          onPressed:  () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreatePlaylist()));
                       
                      },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: CustomText(text: "I N B O X", color: MyColors.white),
          // elevation: 0,
          centerTitle: true,
        ),
        body:Builder(builder: (context) {
        var provider = context.watch<PlaylistProvider>();

        return provider.isloading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
              child: Column(children: [
                      for (int i = 0;
                              i < provider.playlist!.data!.length;
                              i++) ...[
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:50.0,vertical: 15),
                                  child: Row(
                                    
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                                  provider.playlist!.data![i].name!,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                    ),
                                                  Builder(builder: (context) {
                                            context.watch<PlaylistProvider>();
                                            return InkWell(
                                              child: Container(
                                                  width: 100,
                                                  child: Center(
                                
                                                    child: InkWell(
                                                      onTap: () {
                                                        provider.delPlaylistprovider(
                                                                context,
                                                                provider.playlist!.data![i].id);
                                                      },
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: MyColors.red,
                                                      ),
                                                    ),
                                                  )),
                                            );
                                          }),
                                           InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UpdateScreen(
                                                              provider.playlist!.data![i])));
                                            },
                                            child:CustomText(text: "Update")
                                          ),
                                  ],),
                                )
                              ]
                     
                    ]),
            );}));
  }
}


