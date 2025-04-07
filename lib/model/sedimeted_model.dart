import 'package:hive/hive.dart';

part 'sedimeted_model.g.dart';

@HiveType(typeId: 0)
class SedmentedRockModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String desc;

  @HiveField(2)
  String image;

  SedmentedRockModel(
      {required this.name, required this.desc, required this.image});
}
