import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Status_Screen extends StatefulWidget {
  @override
  _Status_ScreenState createState() => _Status_ScreenState();
}

class _Status_ScreenState extends State<Status_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          color: Color(0xFF121E28),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10,),
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: CircleAvatar(
                          radius: 36,
                          backgroundColor: Colors.grey[500],
                          child: Padding(
                            padding: const EdgeInsets.only(top:16.0),
                            child: Icon(Icons.person,color: Colors.white70,size: 60,),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 55,
                        left: 45,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.teal[400],
                          child: Icon(Icons.add,color: Colors.white,size: 23,),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("My Status",style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w600
                      ),),
                      SizedBox(height: 3,),
                      Text("Tap to add status update",style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 15,
                          fontWeight: FontWeight.w400
                      ),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:15.0),
                child: Text("Recent updates",style: TextStyle(color: Colors.grey[400],fontSize: 15),),
              ),
              SizedBox(height: 5,),
              SizedBox(
                height: 498,
                child:FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString("load_json/Users.json"),
                  builder: (context,snapshot){
                    var statusData = jsonDecode(snapshot.data.toString());
                    return
                      ListView.separated(
                        reverse: true,
                        separatorBuilder: (context,index){
                          return Divider(height: 5.0,color: Colors.grey[800],endIndent: 10.0,indent:100.0,);
                        },
                        itemCount: statusData==null?0:statusData.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.only(top:10.0),
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 10,),
                                CircleAvatar(
                                  radius: 36,
                                  backgroundColor: Colors.teal,
                                  child: CircleAvatar(
                                    radius: 34,
                                    backgroundImage: NetworkImage(
                                       statusData[index]["userImage"]
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(statusData[index]["userName"],style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w400
                                    ),),
                                    SizedBox(height: 3,),
                                    Text(statusData[index]["statusTiming"],style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
