import 'package:flutter/material.dart';
import 'package:student/m/addingg.dart';

class App extends StatelessWidget {
@override

Widget build(BuildContext context){
  return MaterialApp(
    home:Abc(),
    );
    }
}

class Abc extends StatelessWidget {
  const Abc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


     appBar: AppBar(
backgroundColor: Colors.green,
elevation: 10,
title: Text('student list'),
centerTitle: true,
      ),

      floatingActionButton: FlatButton(
onPressed: (){
  Navigator.push(context, new MaterialPageRoute(
    builder: (context)=>Addingg ()
    ));
},
child: Icon(Icons.add),
color: Colors.red,
shape: CircleBorder(),
padding:EdgeInsets.all(10),
    ),
    );
  }
}