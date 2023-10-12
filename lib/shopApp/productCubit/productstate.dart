import 'package:app1/shopApp/models/productmodel.dart';

abstract class productstate {}

class initalstate extends productstate {}

class productloadingstate extends productstate {}

class productsucssessstate extends productstate {
  final List<productmodel> model;

  productsucssessstate({required this.model});
}

class producterrorstate extends productstate {
  final String error;

  producterrorstate({required this.error});
}

// class loginSucessstate extends chatloginstate {}

// class loginErrorstate extends chatloginstate {
//   final String error;

//   loginErrorstate({required this.error});
// }
// class socialLoginPasswordVisibility extends chatloginstate {}
