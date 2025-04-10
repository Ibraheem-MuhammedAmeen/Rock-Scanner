import 'package:hive/hive.dart';

part 'mineral_model.g.dart';

@HiveType(typeId: 3)
class MineralRockModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String desc;

  @HiveField(2)
  String image;

  MineralRockModel(
      {required this.name, required this.desc, required this.image});
}
