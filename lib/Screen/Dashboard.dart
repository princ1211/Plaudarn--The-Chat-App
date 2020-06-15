import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipPath(
          clipper: Clipper(),
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Images/home 2.jpg'),
                )
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Text('Sign Up',
                      style: TextStyle(
                        fontSize: 40.0,

                      ),),
                  ),
                  SizedBox(
                    height: 60.0,

                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Email or Phone Number",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Email or Phone Number",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin:EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.blue.shade500,
                    ),
                    child: Center(
                      child: Text('Sign Up',style: TextStyle(color: Colors.white ),),
                    ),
                  )


                ],
              ),

            ),

          ),
        )
      ],
    );
  }
}
class Clipper extends CustomClipper<Path>{
  @override
  Path getClip (Size size){
    var path= Path();
    path.lineTo(0, size.height-0 );
    path.quadraticBezierTo(
        size.width/2-30, size.height,size.width-30,size.height-30
    );
    path.lineTo(size.width,0);
    path.close();
    return path;


  }
  @override
  bool shouldReclip( CustomClipper<Path> oldClipper){
    return false;
  }
}
