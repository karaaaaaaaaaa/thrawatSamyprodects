// ignore_for_file: must_be_immutable, unused_import

import 'package:app1/chats/chatcubit/chatcubit.dart';
import 'package:app1/chats/chatcubit/chatstate.dart';
import 'package:app1/chats/chatsmodel.dart';
import 'package:app1/chats/models/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class chatlayout extends StatelessWidget {
  chatlayout({super.key, required this.email});
  final String email;
  var textController = TextEditingController();
  var scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var message = FirebaseFirestore.instance.collection('messages');
    // FutureBuilder دي بتجبلي حاجه من المستقبل  بس مره واحده بس
    // FutureBuilder<QuerySnapshot>(
    //   future: message.get(),
    //   builder: (context, snapshot) {
    // StreamBuilder اما دي بتجيب حاجات من المستقبل اكتر من مره
    // return StreamBuilder<QuerySnapshot>(
    //   stream: message.snapshots(),
    //   builder: (context, snapshot) {

    return StreamBuilder<QuerySnapshot>(
      stream: message.orderBy('Datetime', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data!.docs[1]['message']);

          List<ChatsModel> messagelist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            print("object");
            // messagelist.add(chmoldel.formjson(snapshot.data!.docs[i],));
            messagelist.add(ChatsModel.FromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/images/family_members/family_older_brother.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("  Chats"),
                ],
              ),
              centerTitle: true,
              backgroundColor: Color(0xff2B475E),
            ),
            body: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.separated(
                        reverse: true,
                        controller: scrollController,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          // var message = chatscubit.get(context).message[index];

                          return (messagelist[index].id == email)
                              ? defultchat(messagelist[index])
                              : resevedMessage(messagelist[index]);
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: messagelist.length),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 22,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: textController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type your message here"),
                            onFieldSubmitted: (value) {
                              message.add({
                                "message": textController.text,
                                'Datetime': DateTime.now().toString(),
                                'id': email
                              });
                              // chatscubit
                              //     .get(context)
                              //     .sendChats(message: textController.text);
                              textController.clear();
                              scrollController.animateTo(0,
                                  duration: Duration(milliseconds: 1),
                                  curve: Curves.fastOutSlowIn);
                                  
                            },
                          ),
                        ),
                        Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              color: Colors.blue,
                            ),
                            child: MaterialButton(
                              minWidth: 1,
                              onPressed: () {
                                message.add({
                                  "message": textController.text,
                                  'Datetime': DateTime.now().toString(),
                                'id': email
                                });
                                // chatscubit
                                //     .get(context)
                                //     .sendChats(message: textController.text);
                                textController.clear();
                                scrollController.jumpTo(
                                  0,
                                  // duration: Duration(milliseconds: 1),
                                  // curve: Curves.fastOutSlowIn
                                );
                              },
                              child: Icon(
                                Icons.send,
                                size: 17,
                                color: Colors.white,
                              ),
                            )),
                        SizedBox(
                          height: 11,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget defultchat(ChatsModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xff2B475E),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              // borderRadius: BorderRadius.only(topRight:Radius.circular(10)),
            ),
            child: Text("${model.text}",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w400)),
          ),
          SizedBox(
            height: 10,
          ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Container(
          //     padding: EdgeInsets.all(16),
          //     decoration: BoxDecoration(
          //       color: Colors.lightGreen,
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(20),
          //           topRight: Radius.circular(20),
          //           bottomLeft: Radius.circular(20)),
          //       // borderRadius: BorderRadius.only(topRight:Radius.circular(10)),
          //     ),
          //     child: Text("don't have an account",
          //         style: TextStyle(
          //             fontSize: 18,
          //             color: const Color.fromARGB(255, 225, 102, 102),
          //             fontWeight: FontWeight.w500)),
          //   ),
          // ),
          SizedBox(
            height: 10,
          )
        ],
      );
  Widget resevedMessage(ChatsModel model) => Column(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 59, 110, 2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                // borderRadius: BorderRadius.only(topRight:Radius.circular(10)),
              ),
              child: Text("${model.text}",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      );
}
