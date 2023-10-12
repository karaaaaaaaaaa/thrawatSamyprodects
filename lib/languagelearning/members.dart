// // ignore_for_file: unused_import

// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';

// class members extends StatelessWidget {
//   const members({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.brown[800],
//         elevation: 0,
//         title: Text("Members"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             defultbuilder(
//               text1: 'ichi',
//               img: 'assets/images/numbers/number_one.png',
//               text2: 'one',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/numbers/number_one_sound.mp3"));
//               },
//             ),
//             defultbuilder(
//               text1: 'Ni',
//               img: 'assets/images/numbers/number_two.png',
//               text2: 'two',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/numbers/number_two_sound.mp3"));
//               },
//             ),
//             defultbuilder(
//               text1: 'san',
//               img: 'assets/images/numbers/number_three.png',
//               text2: 'three',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/numbers/number_three_sound.mp3"));
//               },
//             ),
//             defultbuilder(
//               text1: 'shi',
//               img: 'assets/images/numbers/number_four.png',
//               text2: 'four',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/numbers/number_four_sound.mp3"));
//               },
//             ),
//             defultbuilder(
//               text1: 'Go',
//               img: 'assets/images/numbers/number_five.png',
//               text2: 'five',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/numbers/number_five_sound.mp3"));
//               },
//             ),
//             defultbuilder(
//               text1: 'Roku',
//               img: 'assets/images/numbers/number_six.png',
//               text2: 'six',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/numbers/number_six_sound.mp3"));
//               },
//             ),
//             defultbuilder(
//               text1: 'subun',
//               img: 'assets/images/numbers/number_seven.png',
//               text2: 'seven',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/numbers/number_seven_sound.mp3"));
//               },
//             ),
//             defultbuilder(
//               text1: 'hachi',
//               img: 'assets/images/numbers/number_eight.png',
//               text2: 'eight',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/numbers/number_eight_sound.mp3"));
//               },
//             ),
//             defultbuilder(
//               text1: 'hachi',
//               img: 'assets/images/numbers/number_nine.png',
//               text2: 'nine',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/numbers/number_nine_sound.mp3"));
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
//         color: Colors.amber[600],
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
