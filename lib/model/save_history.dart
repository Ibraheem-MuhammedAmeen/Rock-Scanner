import 'package:hive/hive.dart';

part 'save_history.g.dart';

@HiveType(typeId: 4)
class SaveHistory extends HiveObject {
  @HiveField(0)
  String answer;

  @HiveField(1)
  String base64Image;

  @HiveField(2)
  DateTime time;

  SaveHistory({
    required this.answer,
    required this.base64Image,
    required this.time,
  });
}
