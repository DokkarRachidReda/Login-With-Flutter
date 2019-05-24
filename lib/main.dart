import 'dart:async';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }

  
}



class MyHomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {  
    return Home();
  }
 

  
}


  class Home extends State<MyHomePage> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  Tween<double> tween;
  String login="";
  String pass="";
  int state=0;
  bool loginResult;
  Color btnColor=Colors.green;
  double btnWidth=280;
 
 
   Widget buttonChild(){
   if(state==0){
     return new Text("Log In",style: new TextStyle(color: Colors.white),);
   }
   else if(state==1){
     return new CircularProgressIndicator(backgroundColor: Colors.white,strokeWidth: 2,valueColor: AlwaysStoppedAnimation(Colors.white),);
   }

   else if(state == 2){

    if(loginResult){
      return Icon(Icons.check,color: Colors.white,);
    }else{
      return Icon(Icons.error,color: Colors.white,);
    }



   }
 }

@override
  void initState() {
    super.initState();
   controller= new AnimationController(vsync: this,duration: Duration(milliseconds: 1500));
   tween=new Tween(begin: 0,end: 50);
   animation=tween.animate(controller);
   animation.addListener((){
        setState(() { 

        });
   });

   controller.forward();

  }

  @override
  Widget build(BuildContext context) {
   
   if(state==2 && loginResult != null){

    Timer(Duration(milliseconds: 1300), () {
          if(loginResult){

     }else{
       setState(() {
          state=0;
          loginResult=null;
          btnColor=Colors.green;
          btnWidth=280;
 
       });
     }
    });

     
   }
    
    return Scaffold(
        backgroundColor: Color(0xFFeeeeee),
        body: Container(
            padding: new EdgeInsets.fromLTRB(animation.value, 80, 50, 0) ,
            child: Column(
              children: <Widget>[

              
                new Image(
                  image:AssetImage("./assets/man.png"),
                  width:animation.value +100,
                  height:animation.value +120,
                  ),
                 
                
                new Padding(padding:new EdgeInsets.fromLTRB(0, 50, 10, 0) ),
                
                
                   new Container(
                    height: 40,
                    decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    
                  ),
                  alignment: Alignment.center,
                  child: new Padding(padding: new EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: new TextField(onChanged: (String str){login=str;},
                   textAlign: TextAlign.left,
                    decoration: new InputDecoration.collapsed(
                    hintText: "  username",
                    border: InputBorder.none
                ),
                ),
                  ),
                ),
                
               
                
                
                new Padding(padding:new EdgeInsets.fromLTRB(0, 30, 5, 0) ),
                new Container(
                  height: 40,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    
                  ),
                  alignment: Alignment.center,
                  child: new Padding(padding: new EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: new TextField(onChanged: (String str){pass=str;},
                   textAlign: TextAlign.left,
                    decoration: new InputDecoration.collapsed(
                    hintText: "  password",
                    border: InputBorder.none
                ),
                ),
                  ),
                ),
                
                
                new Padding(padding:new EdgeInsets.fromLTRB(0, 50, 0, 0) ),
                
                new AnimatedContainer(
                  width: btnWidth,
                  duration: Duration(seconds: 1),
                  child: new ButtonTheme(
                  
                  height: 40,
                  child:new RaisedButton(
                  color: btnColor,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)), 
                  child: buttonChild(),
                  onPressed: (){
                    setState(() {
                     state=1; 
                     btnWidth=80;
                     if(login=="me" && pass=="12345"){
                          loginResult=true;
                        }else{loginResult=false;}

                    });

                    Timer(Duration(milliseconds: 1300), () {
                      setState(() {
                        state=2;
                        if( ! loginResult) btnColor=Colors.red;
                           });
                      });
                   
                  },
                  ) ,
                ),

                ),

                


                new Padding(padding: EdgeInsets.only(top: 60),
                child: new Text("don't Have an account ?, Register Now",
                style: TextStyle(fontSize: 10,color: Colors.black),
                ),
                )
                

              ],
              ),
        ),
    );
  }


}
