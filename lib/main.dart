import 'package:flutter/material.dart';
import 'package:whatsappclone/Screens/Status_Screen.dart';
import './Screens/Home_Screen.dart';
import 'Screens/Call_Screen.dart';
import 'Screens/Camera_Screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Whatsapp Clone",
      theme: ThemeData(

      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF232D35),
            title: Text("WhatsApp",style: TextStyle(color: Colors.grey[300],fontSize: 26,fontWeight: FontWeight.w500),),
            actions: <Widget>[
              Icon(Icons.search,size: 25,color: Colors.grey[300],),
              SizedBox(width: 15,),
              Padding(
                padding: const EdgeInsets.only(right:5.0),
                child: Icon(Icons.more_vert,size: 25,color: Colors.grey[300],),
              )
            ],
            bottom: TabBar(
              unselectedLabelColor: Colors.grey[500],
              labelColor: Colors.teal[400],
              indicatorColor: Colors.teal[400],
              tabs: <Widget>[
                Tab(
                  child: Icon(Icons.camera_alt),
                ),
                Tab(
                  child: Text("CHATS",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Tab(
                  child: Text("STATUS",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Tab(
                  child: Text("CALLS",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Camera_Screen(),
              Home_Screen(),
              Status_Screen(),
              Call_Screen(),
            ],
          ),
        ),
      )
    );
  }
}