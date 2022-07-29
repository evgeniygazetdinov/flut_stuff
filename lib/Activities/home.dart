import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key, key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home>{
  List todoList = [];
  MaterialColor mainColor = Colors.blue;
  MaterialAccentColor barColor = Colors.deepPurpleAccent;
  Color addButtonColor = Colors.white;
  MaterialColor backgroundColorForLowButton = Colors.red;
  String _userToDo = '';
  void initState(){
    super.initState();
    todoList.addAll(['купить картошку', 'cходить в озон']);
  }
  void removeItems(index){
    setState(() {
      todoList.removeAt(index);
    });
  }
  void _openMenu(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context){
        return Scaffold(
          appBar: AppBar(title: Text('menu')),
          body:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context);
                          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                        }, child: Text('на главную')),
                        Text('мое меню'),
                  ],
              )
        );
      })
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: Text('список дел'),
        centerTitle: true,
          backgroundColor: barColor,
          actions: [
            CircleAvatar(
                radius: 30,
                backgroundColor: Colors.greenAccent, //<-- SEE HERE
                child:
                IconButton(
                    onPressed: (){
                        _openMenu();
                    },
                    icon: Icon(Icons.menu,
                  color: Colors.black))),
        ],
      ),
    body: ListView.builder(itemBuilder: (BuildContext context, int index){
      return Dismissible(key: Key(todoList[index]),
          child: Card(
            child: ListTile(title: Text(todoList[index]),
            trailing: IconButton(
            icon: Icon(Icons.delete_forever,
              color: mainColor),
              onPressed: (){
                print('index im here');
                setState((){todoList.removeAt(index);});
                }),
              ),
          ),
        onDismissed: (direction){
          // if direction == DismissDirection.endToStart
            print('index im here');
          setState(() {
        todoList.removeAt(index);

      });
    },
      );
    }, itemCount: todoList.length,),
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgroundColorForLowButton,
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text('добавить задание'),
              content: TextField(
                onChanged: (String value){
                        _userToDo = value;
                        },),
              actions: [
                ElevatedButton(onPressed: (){
                    setState(() {
                      if(_userToDo != '' && todoList.last != _userToDo){
                        todoList.add(_userToDo);
                      }
                    });
                    Navigator.of(context).pop();
                  },
                child: Text('добавить')),
              ]

              ,);
          });
        },
        child: Icon(Icons.add, color: addButtonColor)
      ),
    );
  }
}