import 'package:flutter/material.dart';
import 'package:to_do_flutter/Activities/home.dart';
import 'package:to_do_flutter/Activities/main_screen.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(primaryColor: Colors.deepOrange),
  initialRoute: '/',
  routes: {
    '/': (context) => MainScreen(),
    '/todo': (context)=> Home(),
  },
));
