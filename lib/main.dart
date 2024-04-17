import 'package:flutter/material.dart';
import 'package:flutter_festival_post_app/edit_image.dart';
import 'package:flutter_festival_post_app/edit_post.dart';
import 'package:flutter_festival_post_app/home_page.dart';
import 'package:flutter_festival_post_app/splash_screen.dart';

void main()
{
  runApp(Myapp());
}
class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      routes: {
        "splash_screen":(context)=>splashscreen(),
        "home":(context)=>Homepage(),
        "edit":(context)=>Edit(),
        "editpost":(context)=>EditPost(),


      },
    );
  }
}
