import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat_Screen extends StatefulWidget {
  String userImage, userName;
  Chat_Screen({this.userImage, this.userName});
  @override
  _Chat_ScreenState createState() => _Chat_ScreenState();
}

class _Chat_ScreenState extends State<Chat_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF455a64),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              width: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                      image: NetworkImage(widget.userImage),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 10,
            ),
            Center(
                child: Text(
              widget.userName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
            SizedBox(
              width: 140,
            ),
            Icon(
              Icons.videocam,
              color: Colors.white,
              size: 28,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.call,
              color: Colors.white,
              size: 28,
            ),
            SizedBox(
              width: 15,
            ),
            Icon(Icons.more_vert, color: Colors.white, size: 28),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFF121E28),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              Bubble(
                alignment: Alignment.center,
                color: Color.fromRGBO(212, 234, 244, 1.0),
                child: Text('TODAY',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11.0)),
              ),
              Bubble(
                margin: BubbleEdges.only(top: 10),
                alignment: Alignment.topRight,
                nip: BubbleNip.rightTop,
                color: Color.fromRGBO(225, 255, 199, 1.0),
                child: Text('Hey!', textAlign: TextAlign.right),
              ),
              Bubble(
                margin: BubbleEdges.only(top: 10),
                alignment: Alignment.topLeft,
                nip: BubbleNip.leftTop,
                child: Text('Hello There!'),
              ),
              Bubble(
                margin: BubbleEdges.only(top: 10),
                alignment: Alignment.topRight,
                nip: BubbleNip.rightBottom,
                color: Color.fromRGBO(225, 255, 199, 1.0),
                child: Text('How are you?', textAlign: TextAlign.right),
              ),
              Bubble(
                margin: BubbleEdges.only(top: 10),
                alignment: Alignment.topLeft,
                nip: BubbleNip.leftBottom,
                child: Text('Im Fine '),
              ),      
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0, left: 5, right: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: roundedContainer,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  final roundedContainer = ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Container(
      color: Color(0xFF455a64),
      child: Row(
        children: <Widget>[
          SizedBox(width: 8.0),
          Icon(Icons.insert_emoticon, size: 30.0, color: Colors.white70),
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Type a message',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white70)),
            ),
          ),
          Icon(Icons.attach_file, size: 30.0, color: Colors.white70),
          SizedBox(width: 8.0),
          Icon(Icons.camera_alt, size: 30.0, color: Colors.white70),
          SizedBox(width: 8.0),
        ],
      ),
    ),
  );
}
