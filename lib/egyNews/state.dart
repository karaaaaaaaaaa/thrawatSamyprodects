abstract class Cubitstate {}

class initstate extends Cubitstate {}

class bottomnavstate extends Cubitstate {}

class businessLoadingstate extends Cubitstate {}

class businesssuccessstate extends Cubitstate {}

class businessErrorstate extends Cubitstate {
  late final String error;
  businessErrorstate(this.error);
}

class NewsGetScienceLoadingState extends Cubitstate {}

class NewsGetScienceSuccessState extends Cubitstate {}

class NewsGetScienceErrorState extends Cubitstate {
  late final String error;
  NewsGetScienceErrorState(this.error);
}
class NewsGetSearchLoadingState extends Cubitstate{}
class NewsGetSearchSuccessState extends Cubitstate{}
class NewsGetSearchErrorState extends Cubitstate
{
  late final String error;
  NewsGetSearchErrorState(this.error);
}
