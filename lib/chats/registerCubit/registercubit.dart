import 'package:app1/chats/registerCubit/registerstate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class chatregistercubit extends Cubit<chatregisterstate> {
  chatregistercubit() : super(registerinitalstate());
  static chatregistercubit get(context) => BlocProvider.of(context);
  getloginDate({ String? emailAddress,  String ?password}) async {
    emit(registerloadingstate());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailAddress!,
      password: password!,
    )
        .then((value) {
      emit(registerSucessstate());
    }) .catchError((error) {
      print(error.toString());
      emit(registerErrorstate(error: error.toString()));
    });
  }
}
