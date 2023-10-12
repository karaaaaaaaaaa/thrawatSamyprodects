// // ignore_for_file: unused_import

// import 'package:app1/languagelearning/colors.dart';
// import 'package:app1/languagelearning/famliy.dart';
// import 'package:app1/languagelearning/members.dart';
// import 'package:app1/languagelearning/phrases.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';

// class tunes extends StatefulWidget {
//   const tunes({super.key});

//   @override
//   State<tunes> createState() => _tunesState();
// }

// class _tunesState extends State<tunes> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( backgroundColor: Color(0xffFEF6DB),
//       appBar: AppBar(
//         backgroundColor: Colors.brown[800],
//         elevation: 0,
//         title: Text("Flutter Tune"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           GestureDetector(
//               onTap: () {
//                 print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("tones/note1.wav"));
//               },
//               child: defultconta(color: Colors.red)),
//           GestureDetector(
//              onTap: () {
//               print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("tones/note2.wav"));
//               },
            
//             child: defultconta( color: Color(0xffF49431))),
//           GestureDetector(
//              onTap: () {
//         print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("tones/note3.wav"));        
//               },
//             child: defultconta(color: Colors.yellow)),
//           GestureDetector(
//              onTap: () {
//                print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("tones/note4.wav"));
//               },
//             child: defultconta( color: Color(0xff3DC15B))),
              
//                  GestureDetector(
//              onTap: () {
//                print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("tones/note5.wav"));
//               },
//             child: defultconta( color: Color.fromARGB(255, 56, 158, 61))),
//                    GestureDetector(
//              onTap: () {
//                  print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("tones/note6.wav"));
//               },
//             child: defultconta( color: Colors.blue)),
              
//                Expanded(
//                  child: GestureDetector(
//                             onTap: () {
//                    print("dddddddddddddddd");
//                 final player = AudioPlayer();
//                 player.play(AssetSource("tones/note7.wav"));
//                              },
//                            child: defultconta( color: Color(0xff9A10A8))),
//                ),
//         ],
//       ),
//     );
//   }

//   Widget defultconta({ required Color color}) => Container(
//         width: double.infinity,
//         padding: EdgeInsets.all(18),
//         color: color,
//         height: 103,
//       );
// }
