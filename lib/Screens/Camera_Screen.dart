import 'package:flutter/material.dart';
class Camera_Screen extends StatefulWidget {
  @override
  _Camera_ScreenState createState() => _Camera_ScreenState();
}

class _Camera_ScreenState extends State<Camera_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          color: Color(0xFF121E28),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Icon(Icons.camera_alt,color: Colors.white70,size: 200,),
          ),
        )
    );
  }
}
