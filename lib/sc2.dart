import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final abc;
  Screen2({ this.abc});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            abc.toString(),
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

// class Screen3 extends StatelessWidget {
//   final data;
//   Screen2({this.data});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Text(
//             data.toString(),
//             style: TextStyle(fontSize: 30),
//           ),
//         ),
//       ),
//     );
//   }
// }
