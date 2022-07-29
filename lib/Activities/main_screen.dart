import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget{
 List todoList = [];
 MaterialColor mainColor = Colors.blue;
 MaterialAccentColor barColor = Colors.deepPurpleAccent;
 Color addButtonColor = Colors.white;
 MaterialColor backgroundColorForLowButton = Colors.red;
 String _userToDo = '';
 void removeItems(index){
 }

 @override
 Widget build(BuildContext context){
  return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
         title: Text('список дел'),
          centerTitle: true,
          backgroundColor: barColor
      ),
      body: Column(
        children: [
           Text('main screen'),
           ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/todo');
           }, child: Text('перейти далее'))
        ]
       ) ,
    );
 }
}