import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Sign_in.dart';
import 'Sign_up.dart';


class Welcome extends StatefulWidget {
  static const String id ='Welcome';
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[


          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text('Communify',
                    style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,

                    ),),
                ),
                SizedBox(height: 48.0,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.pushNamed(context, Sign_in.id);

                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text('Sign In'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.pushNamed(context, Sign_up.id);

                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text('Sign Up'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

      ),
    );
  }
}
