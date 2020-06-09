import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/Screens/Chat_Screen.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFF121E28),
          child: Center(
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString("load_json/Users.json"),
              builder: (context,snapshot){
                var userData = jsonDecode(snapshot.data.toString());
                print(userData);
                return
                  ListView.separated(
                    separatorBuilder: (context,index){
                      return Divider(height: 5.0,color: Colors.grey[800],endIndent: 10.0,indent:100.0,);
                    },
                    itemCount: userData ==null ?0:userData.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 10,),
                            GestureDetector(
                              onTap: (){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                        backgroundColor: Color(0xFF121E28),
                                        elevation: 10.0,
                                        title: Text(userData[index]["userName"],style: TextStyle(color: Colors.white),),
                                        content: Container(
                                          height: 200,
                                          width: 250,
                                          child: Image(
                                            image: NetworkImage(userData[index]["userImage"]),
                                            fit: BoxFit.cover,
                                          ),
                                        ),


                                      );
                                    }
                                );
                              },
                              child: CircleAvatar(
                                radius: 36,
                                backgroundImage: NetworkImage(
                                    userData[index]["userImage"]
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>Chat_Screen(userImage:userData[index]["userImage"],userName:userData[index]["userName"])));
                              },
                              child: Container(
                                width: 250,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("${userData[index]["userName"]}",style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w400
                                    ),),
                                    SizedBox(height: 3,),
                                    Text("${userData[index]["subString"]}",style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400
                                    ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Column(
                                children: <Widget>[
                                  Text("${userData[index]["time"]}",style: TextStyle(
                                      color: Colors.white
                                  ),)
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
              },
            ),
          )
        ),
      ),
    );
  }
}
