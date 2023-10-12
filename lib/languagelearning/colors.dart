// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';

// class Colorss extends StatelessWidget {
//   const Colorss({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.brown[800],
//         elevation: 0,
//         title: Text("Colors"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             defultbuilder(
//               text1: 'Burakku',
//               img: 'assets/images/colors/color_black.png',
//               text2: 'Black',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/colors/black.wav"));
//               },
//             ),
//              defultbuilder(
//               text1: 'chairo',
//               img: 'assets/images/colors/color_brown.png',
//               text2: 'brown',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/colors/brown.wav"));
//               },
//             ),
//              defultbuilder(
//               text1: 'Hokori ppoi kiro',
//               img: 'assets/images/colors/color_dusty_yellow.png',
//               text2: 'dusty yellow',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/colors/dustyyellow.wav"));
//               },
//             ),
//              defultbuilder(
//               text1: 'Gure',
//               img: 'assets/images/colors/color_gray.png',
//               text2: 'gray',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/colors/gray.wav"));
//               },
//             ),
//              defultbuilder(
//               text1: 'Midori',
//               img: 'assets/images/colors/color_green.png',
//               text2: 'green',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/colors/green.wav"));
//               },
//             ),
//              defultbuilder(
//               text1: 'Aka',
//               img: 'assets/images/colors/color_red.png',
//               text2: 'red',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/colors/red.wav"));
//               },
//             ),
//              defultbuilder(
//               text1: 'Shiror',
//               img: 'assets/images/colors/color_white.png',
//               text2: 'white',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/colors/white.wav"));
//               },
//             ),
//              defultbuilder(
//               text1: 'kiro',
//               img: 'assets/images/colors/yellow.png',
//               text2: 'yellow',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/colors/yellow.wav"));
//               },
//             ),
           
//           ],
//         ),
//       ),
//     );
//   }

//   Widget defultbuilder({
//     required String text1,
//     required String img,
//     required String text2,
//     required Function function,
//   }) =>
//       Container(
//         width: double.infinity,
//         height: 90,
//         color: Color(0xff7E3FA3),
//         child: Row(
//           children: [
//             Container(
//               color: Color(0xffFFF6DC),
//               child: Image(
//                   width: 100,
//                   image: AssetImage(
//                     "${img}",
//                   )),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "${text1}",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text("${text2}",
//                     style: TextStyle(color: Colors.white, fontSize: 20)),
//               ],
//             ),
//             Spacer(
//               flex: 1,
//             ),
//             IconButton(
//                 onPressed: () {
//                   function();
//                 },
//                 icon: Icon(
//                   Icons.play_arrow,
//                   color: Colors.white,
//                 )),
//           ],
//         ),
//       );
// }
