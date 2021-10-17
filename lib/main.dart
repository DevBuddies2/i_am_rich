import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//stless + enter

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        // flexibleSpace: ,
        // leading: Icon(Icons.search_sharp),
        title: Text('I Am Rich'),
        // actions: [
        //   Icon(Icons.search_sharp),
        //   Icon(Icons.search_sharp),
        //   Icon(Icons.search_sharp)
        // ],
        backgroundColor: Color(0xff59727E), //0xff+ haxCode without #
      ),
      body: Center(
        // child: Image.network(
        //   'https://images.unsplash.com/photo-1634334979124-04aca8868d45?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
        //   height: 100,
        //   width: 200,
        // ),
        child: Image.asset('image/img.jpg'),
      ),
    ));
  }
}
