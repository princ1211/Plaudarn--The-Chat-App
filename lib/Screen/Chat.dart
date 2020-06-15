import 'package:flutter/material.dart';

import 'package:plaudarn/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

final _firestore= Firestore.instance;
FirebaseUser loggeduser;

class Chat extends StatefulWidget {
  static const String id ='Chat';
  @override

  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final textcontroller=TextEditingController();

  final _auth=FirebaseAuth.instance;

  String messagetext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }
  void getuser() async{
    try{
      final user= await _auth.currentUser();
      if (user!=null){
        loggeduser=user;
        print(loggeduser.email);

      }
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Plaudarn'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Messagestream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textcontroller,
                      onChanged: (value) {

                        messagetext=value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      textcontroller.clear();
                     _firestore.collection('messages').add({
                       'Text':messagetext,
                       'sender': loggeduser.email,

                     });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Messagestream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      // ignore: missing_return
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          );

        }
        final messages= snapshot.data.documents.reversed;
        List<MessageBubble> messagewidgets=[];
        for (var message in messages){
          final messagetext=message.data['Text'];
          final messagesender= message.data['sender'];
          final currentuser= loggeduser.email;

          final messagebubble= MessageBubble(text: messagetext, sender: messagesender,isme: currentuser==messagesender,);
          messagewidgets.add(messagebubble);
        }

        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            children: messagewidgets,
          ),
        );


      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text,this.isme});
  final String text;
  final String sender;
  final bool isme;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: isme ? CrossAxisAlignment.end: CrossAxisAlignment.start,
          children: <Widget>[
            Text(sender,style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),),
            Material(
              elevation: 5.0,
              borderRadius: isme? BorderRadius.only(topLeft: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0))
              :BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0)),
              color:isme?  Colors.lightBlueAccent: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,
                horizontal: 20.0),
                child: Text('$text ',
                style: TextStyle(
                  fontSize: 15.0,
                  color: isme ?Colors.white: Colors.black54,
                ),),
              ),
            ),
          ],
        ));
  }
}
