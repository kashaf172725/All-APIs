import 'package:flutter/material.dart';
import 'package:flutter_application_1/API_screens/view/playlist.dart';
import 'package:provider/provider.dart';
import '../../utils/const.dart';
import '../controller/provider/playlistProvider.dart';
import 'images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

@override
  void initState() {
   getplaylist1();
    super.initState();
  }


  getplaylist1(){
  var provider =  context.read<PlaylistProvider>();
  provider.getplaylistprovider(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .01,
                horizontal: MediaQuery.of(context).size.width * .01,
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                     
                          child: Logo.logo
                    ),
                    Text(
                      "Dashboard",
                      style: TextStyle(
                          color: MyColors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "WELCOME ADMIN!",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: MyColors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Good Morning",
                          style: TextStyle(fontSize: 14, color: MyColors.dark_blue),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: MyColors.dark_blue),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "LIVE",
                            style: TextStyle(color: MyColors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .6,
                        // color: Colors.amber,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // novideo(context),
                              Container(
                                height: 200,

                                // behavior: MyCustomScrollBehavior(),
                                child: ListView.builder(
                                    // itemCount: images.length,
                                    shrinkWrap: true,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 200,
                                              width: 180,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  image: DecorationImage(
                                                      image: NetworkImage(""
                                                          // images[index]
                                                          ),
                                                      fit: BoxFit.cover)),
                                            ),
                                            Container(
                                              height: 200,
                                              width: 180,
                                              color: Colors.black12,
                                            ),
                                            const Positioned(
                                                bottom: 15,
                                                left: 10,
                                                child: Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.white,
                                                )),
                                            Positioned(
                                                bottom: 15,
                                                right: 10,
                                                child: Container(
                                                  color: Colors.black87,
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(3.0),
                                                    child: Text(
                                                      "05:20",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11),
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .3,
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Latest Playlist",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.black),
                              ),
                              InkWell(
                                onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder:(context) => Playlist()));
                                },
                                child: Text(
                                  "see all",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: MyColors.black),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Builder(
                            builder: (context) {
                             var  provider = context.watch<PlaylistProvider>();
                              return  provider.isloading ?CircularProgressIndicator(): 
                              Column(
                                children: [
                                  for (int i = 0; i < provider.playlist["data"].length; i++)
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 4.0),
                                      child: Container(
                                          width: MediaQuery.of(context).size.width * .3,
                                          decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: MyColors.white)),
                                          child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            leading: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                    image: const DecorationImage(
                                                        image: NetworkImage(
                                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHXxIYiq_T7DYdZfqlUfa9Lg3P2cM6xiR7177e-UtoOhKZejmht22JGGrcvfm1TM02V3U&usqp=CAU"),
                                                        fit: BoxFit.fitHeight))),
                                            title: Text(
                                             provider.playlist["data"][i]["name"],
                                              style: TextStyle(
                                                  color: MyColors.black, fontSize: 16),
                                            ),
                                            trailing: Icon(
                                              Icons.playlist_play,
                                              color: MyColors.black,
                                            ),
                                          )),
                                    ),
                                ],
                              );
                            }
                          ),
                        ]),
                      ),
                    ]),
              ]),
            ),
          ));
        
      
    
  }
}
