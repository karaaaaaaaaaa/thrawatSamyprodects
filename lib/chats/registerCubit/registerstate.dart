abstract class chatregisterstate {}

class registerinitalstate extends chatregisterstate {}

class registerloadingstate extends chatregisterstate {}

class registerSucessstate extends chatregisterstate {}

class registerErrorstate extends chatregisterstate {
  final String error;

  registerErrorstate({required this.error});
}
