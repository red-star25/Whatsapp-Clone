import 'dart:convert';

import 'package:flutter/material.dart';
class Call_Screen extends StatefulWidget {
  @override
  _Call_ScreenState createState() => _Call_ScreenState();
}

class _Call_ScreenState extends State<Call_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:Container(
          color: Color(0xFF121E28),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("load_json/Users.json"),
            builder: (context,snapshot){
              var callData = jsonDecode(snapshot.data.toString());
              return
                ListView.separated(
                  separatorBuilder: (context,index){
                    return Divider(height: 5.0,color: Colors.grey[800],endIndent: 10.0,indent:100.0,);
                  },
                  itemCount:callData==null?0: 5,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 10,),
                          CircleAvatar(
                            radius: 34,
                            backgroundImage: NetworkImage(
                                callData[index]["userImage"]
                            ),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("${callData[index]["userName"]}",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w400
                              ),),
                              SizedBox(height: 3,),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.call_received,color: Colors.redAccent[100],size: 19,),
                                  SizedBox(width: 5,),
                                  Text("29 March,8:15 pm",style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400
                                  ),),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 125,),
                          Icon(Icons.videocam,color: Colors.teal,size: 30,)
                        ],
                      ),
                    );
                  },
                );
            },
          ),
        )
    );
  }
}
