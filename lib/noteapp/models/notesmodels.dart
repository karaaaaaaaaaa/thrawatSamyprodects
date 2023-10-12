import 'package:hive/hive.dart';
// flutter packages pub run build_runner build
part 'notesmodels.g.dart';

@HiveType(typeId: 0)
class notemodel extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
   String subtitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
   int color;

  notemodel(
      {required this.title,
      required this.subtitle,
      required this.date,
      required this.color});
}
