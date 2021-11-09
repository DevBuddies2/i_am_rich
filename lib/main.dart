import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iamrich/LocalDbConnect.dart';
import 'package:http/http.dart' as http;
import 'package:iamrich/sc2.dart';

void main() {
  runApp(MyApp());
}

//stless + enter

LocalDbConnect localDbConnect = LocalDbConnect();

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  getData() async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        print(response.body);
        return json.decode(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // localDbConnect.asyncInit();
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
      // body: Center(
      //   // child: Image.network(
      //   //   'https://images.unsplash.com/photo-1634334979124-04aca8868d45?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
      //   //   height: 100,
      //   //   width: 200,
      //   // ),
      //   child: Image.asset('image/img.jpg'),
      // ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Screen2(
                                      abc: snapshot.data[index]['address'],
                                    )));
                      },
                      child: Text(snapshot.data[index]['address'].toString()));
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }
}
