// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';

// class family extends StatelessWidget {
//   const family({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.brown[800],
//         elevation: 0,
//         title: Text("Family"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             defultbuilder(
//               text1: 'chichioya',
//               img: 'assets/images/family_members/family_father.png',
//               text2: 'father',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/family_members/father.wav"));
//               },
//             ),
//             defultbuilder(
//               text1: 'Hahaoya',
//               img: 'assets/images/family_members/family_mother.png',
//               text2: 'Mother',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/family_members/mother.wav"));
//               },
//             ),
//             defultbuilder(
//               text1: 'musume',
//               img: 'assets/images/family_members/family_daughter.png',
//               text2: 'daughter',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/family_members/daughter.wav"));
//               },
//             ),
//             defultbuilder(
//               text1: 'Musuko',
//               img: 'assets/images/family_members/family_son.png',
//               text2: 'son',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("sounds/family_members/son.wav"));
//               },
//             ),
//             defultbuilder(
//               text1: 'ojisan',
//               img: 'assets/images/family_members/family_grandfather.png',
//               text2: 'grand father',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player
//                     .play(AssetSource("sounds/family_members/grandfather.wav"));
//               },
//             ),
//             defultbuilder(
//               text1: 'sobo',
//               img: 'assets/images/family_members/family_grandmother.png',
//               text2: 'grand mother',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player
//                     .play(AssetSource("sounds/family_members/grandmother.wav"));
//               },
//             ),
//             defultbuilder(
//               text1: 'Ane',
//               img: 'assets/images/family_members/family_older_sister.png',
//               text2: 'older sister',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player
//                     .play(AssetSource("sounds/family_members/oldersister.wav"));
//               },
//             ),
//             defultbuilder(
//               text1: 'nisan',
//               img: 'assets/images/family_members/family_older_brother.png',
//               text2: 'older brother',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(
//                     AssetSource("sounds/family_members/olderbother.wav"));
//               },
//             ),
//               defultbuilder(
//               text1: 'nisan',
//               img: 'assets/images/family_members/family_younger_brother.png',
//               text2: 'younger brother',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(
//                     AssetSource("sounds/family_members/youngerbrother.wav"));
//               },
//             ),
//               defultbuilder(
//               text1: 'nisan',
//               img: 'assets/images/family_members/family_younger_sister.png',
//               text2: 'younger sister',
//               function: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(
//                     AssetSource("sounds/family_members/youngersister.wav"));
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
//         color: Colors.green,
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
