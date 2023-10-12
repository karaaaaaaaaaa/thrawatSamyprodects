// // ignore_for_file: unused_local_variable

// import 'package:app1/chats/chatcubit/chatstate.dart';
// import 'package:app1/chats/chatsmodel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class chatscubit extends Cubit<chatsStates> {
//   chatscubit() : super(initalState());
//   static chatscubit get(context) => BlocProvider.of(context);
//   // ChatsModel? chatsModel;
//   void sendChats({
//     required String message,
//   }) {
//   ChatsModel  chatsModel = ChatsModel(text: message);
//     FirebaseFirestore.instance
//         .collection('messages')
//         .add({"message": message}).then((value) {
//       emit(sendchatsSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(sendchatserrorrState());
//     });
//   }
//   List<ChatsModel> message = [];
//     void GetMessage(
//   //     {
//   //    required String ReseverId,
//   // }
//   ) {

//     FirebaseFirestore.instance
//         .collection('messages')
//         .snapshots()
//         .listen((event) {
//       message.clear();

//       event.docs.forEach((element) {
//         message.add(ChatsModel.FromJson(element.data()));
//       });
//       emit(getMessageSuccessState());
//     });
//   }
// }
