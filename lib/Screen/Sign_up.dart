import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plaudarn/Screen/Chat.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class Sign_up extends StatefulWidget {
  static const String id ='Sign_up';
  @override
  _Sign_upState createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  bool showspinner = false;
  String email;
  String password;
  final _auth= FirebaseAuth.instance;
    @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.lightBlue[400],
                    Color(0xFF48CAE4),
                    Color(0xFF0077B6),

                  ]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Hello There', style: TextStyle(fontSize: 40.0,color: Colors.white),),

                    SizedBox(height: 40.0,),


                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),

                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(

                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        border:Border(bottom : BorderSide(color: Colors.grey))
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(color: Colors.grey),
                                          hintText: 'Name',
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),SizedBox(height: 15.0,),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        border:Border(bottom : BorderSide(color: Colors.grey))
                                    ),
                                    child: TextField(
                                      onChanged: (value){
                                        email=value;
                                      },
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(color: Colors.grey),
                                          hintText: 'Email or Phone Number',
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.0,),
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        border:Border(bottom : BorderSide(color: Colors.grey))
                                    ),
                                    child: TextField(
                                      obscureText: true,
                                      onChanged: (value){
                                        password=value;
                                      },
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(color: Colors.grey),
                                          hintText: 'Password',
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),


                                  SizedBox(height: 50.0,),
                                  FlatButton(
                                    onPressed: ()async {
                                      setState(() {
                                        showspinner=true;
                                      });
                                      try{
                                        final user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                                      if (user!=Null){
                                        Navigator.pushNamed(context, Chat.id);
                                      }
                                      setState(() {
                                        showspinner=false;
                                      });
                                      }

                                      catch(e){
                                        print(e);
                                      }
                                      },
                                    child: Container(
                                      height: 50.0,
                                      margin: EdgeInsets.symmetric(horizontal: 50.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.lightBlue[700],

                                      ),

                                      child: Center(
                                        child: Text('Sign Up', style: TextStyle(color:Colors.white,fontSize: 17.0,fontWeight: FontWeight.bold ),),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
