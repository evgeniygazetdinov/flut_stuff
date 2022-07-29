import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: UserPanel(),
));
class UserPanel extends StatefulWidget {
  const UserPanel({Key? key}) : super(key: key);

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  int _count = 0;

  void myCounter() {
    setState(() {
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text('йобырь коз'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body:
        SafeArea(
            child:
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Column(

                    children: [
                      Padding(padding: EdgeInsets.only(top: 100),),
                      CircleAvatar(
                        backgroundImage:
                        AssetImage('asset/1.jpg'),
                        radius: 50,
                      ),
                      Padding(padding: EdgeInsets.only(top:30)),
                      Text('john down', style: TextStyle(fontSize: 30, color: Colors.white)),
                      Row(
                        children: [
                          Icon(Icons.mail, size:50),
                          Padding(padding: EdgeInsets.only(left:20),),
                          Text('myemail.com', style: TextStyle(color: Colors.white))
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      Text('Count $_count', style: TextStyle(color: Colors.cyanAccent)),
                      ElevatedButton(child: Text('+1'), onPressed: myCounter),
                      Row(
                          children:
                          [
                            ElevatedButton(child: Text('к нулю'), onPressed: (){setState((){_count = 0;});}),
                          ]
                      )

                    ],
                  ),
                ]
            )
        )
    );
  }
}