// import 'package:app1/languagelearning/colors.dart';
// import 'package:app1/languagelearning/famliy.dart';
// import 'package:app1/languagelearning/phrases.dart';
// import 'package:flutter/material.dart';

// import 'members.dart';

// class languagelearning extends StatelessWidget {
//   const languagelearning({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffFEF6DB),
//       appBar: AppBar(
//         backgroundColor: Colors.brown[800],
//         elevation: 0,
//         title: Text("Toku"),
//       ),
//       body: Column(
//         children: [
//           GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => members(),
//                     ));
//               },
//               child: defultconta(text: 'Members', color: Colors.amber)),
//           GestureDetector(
//              onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => family(),
//                     ));
//               },
            
//             child: defultconta(text: 'Family Members', color: Color(0xff538033))),
//           GestureDetector(
//              onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Colorss(),
//                     ));
//               },
//             child: defultconta(text: 'Colors', color: Color(0Xff7E3fA3))),
//           GestureDetector(
//              onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => phrases(),
//                     ));
//               },
//             child: defultconta(text: 'phrases', color: Color(0xff48A5cc))),
//         ],
//       ),
//     );
//   }

//   Widget defultconta({required String text, required Color color}) => Container(
//         width: double.infinity,
//         padding: EdgeInsets.all(18),
//         color: color,
//         child: Text(
//           "${text}",
//           style: TextStyle(fontSize: 22, color: Colors.white),
//         ),
//       );
// }
