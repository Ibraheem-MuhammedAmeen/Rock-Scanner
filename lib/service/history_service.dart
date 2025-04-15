// lib/services/history_service.dart
import 'package:hive/hive.dart';
import 'package:rock_scanner/model/save_history.dart';

class HistoryService {
  final Box<SaveHistory> _rockBox = Hive.box<SaveHistory>('History');

  void saveHistory({required String answer, required String base64Image}) {
    final newItem = SaveHistory(
      answer: answer,
      base64Image: base64Image,
      time: DateTime.now(),
    );
    _rockBox.add(newItem);
  }

  List<SaveHistory> getAllHistory() {
    return _rockBox.values.toList();
  }

  void clearHistory() {
    _rockBox.clear();
  }
}
