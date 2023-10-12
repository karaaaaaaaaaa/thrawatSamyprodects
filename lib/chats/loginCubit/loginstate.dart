abstract class chatloginstate {}

class initalstate extends chatloginstate {}

class loginloadingstate extends chatloginstate {}

class loginSucessstate extends chatloginstate {}

class loginErrorstate extends chatloginstate {
  final String error;

  loginErrorstate({required this.error});
}
class socialLoginPasswordVisibility extends chatloginstate {}
