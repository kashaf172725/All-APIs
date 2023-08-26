import 'package:flutter/material.dart';
import 'package:flutter_application_1/API_screens/controller/provider/PlaylistProvider.dart';
import 'package:provider/provider.dart';
import '../../utils/const.dart';
import '../widgets.dart';
class CreatePlaylist extends StatefulWidget {
const CreatePlaylist({super.key});

  @override
  State<CreatePlaylist> createState() => _CreatePlaylistState();
}

class _CreatePlaylistState extends State<CreatePlaylist> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundcolor,
      body:   Center(
        child: Container(
                margin: EdgeInsets.all(15),
                height: 200,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  CustomText( text:"Create Playlist",fontSize: 15,fontWeight: FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:12.0),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration( 
                      labelText: "Enter playlist name"),),
                  )
              ,  Builder(
                builder: (context) {
                  var blox = context.watch<PlaylistProvider>();
                  return blox.loading ? CircularProgressIndicator() : InkWell(
                    onTap: ()async{
                  var provider=    context.read<PlaylistProvider>();
                  await provider.addPlaylistprovider(context, controller.text);

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
                                          "Create Playlist",
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