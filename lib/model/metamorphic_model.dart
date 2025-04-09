import 'package:hive/hive.dart';

part 'metamorphic_model.g.dart';

@HiveType(typeId: 1)
class MetamorphicRockModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String desc;

  @HiveField(2)
  String image;

  MetamorphicRockModel(
      {required this.name, required this.desc, required this.image});
}
