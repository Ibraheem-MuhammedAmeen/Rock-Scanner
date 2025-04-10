import 'package:hive/hive.dart';

part 'igneous_model.g.dart';

@HiveType(typeId: 2)
class IgneousRockModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String desc;

  @HiveField(2)
  String image;

  IgneousRockModel(
      {required this.name, required this.desc, required this.image});
}
