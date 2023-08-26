
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/API_screens/view/createPlaylist.dart';
import 'package:flutter_application_1/API_screens/view/update_screen.dart';
import 'package:provider/provider.dart';
import '../../utils/const.dart';
import '../controller/provider/PlaylistProvider.dart';


class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.white,
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(14.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: MyColors.black),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 15,
                    color: MyColors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "Playlists",
          style: TextStyle(color: MyColors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Builder(builder: (context) {
        var provider = context.watch<PlaylistProvider>();

        return provider.isloading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Container(
                            color: MyColors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 100,
                                    child: const Center(
                                      child: Text(
                                        "Image",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    child: const Center(
                                      child: Text(
                                        "Title",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: const Center(
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: const Center(
                                      child: Text(
                                        "Play",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          for (int i = 0;
                              i < provider.playlist!.data!.length;
                              i++) ...[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: MyColors.white,
                                      border: Border(
                                          bottom: BorderSide(
                                              color: MyColors.black))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Center(
                                            child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    image: const DecorationImage(
                                                        image: NetworkImage(
                                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHXxIYiq_T7DYdZfqlUfa9Lg3P2cM6xiR7177e-UtoOhKZejmht22JGGrcvfm1TM02V3U&usqp=CAU"),
                                                        fit:
                                                            BoxFit.fitHeight))),
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          child: Center(
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
                                        ),
                                        Builder(builder: (context) {
                                          context.watch<PlaylistProvider>();
                                          return InkWell(
                                            child: Container(
                                                width: 100,
                                                child: Center(

                                                  child: InkWell(
                                                    onTap: () {
                                                      provider
                                                          .delPlaylistprovider(
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
                                          child: Container(
                                              width: 100,
                                              child: Center(
                                                child: Icon(
                                                  Icons.play_arrow,
                                                  color: MyColors.lightGreen,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                 
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreatePlaylist()));
                       
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: MyColors.lightGreen,
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
                                width: 10,
                              ),
                              Text(
                                "Create Playlist",
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
      }),
    );
  }
}
