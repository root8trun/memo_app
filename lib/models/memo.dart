import 'package:uuid/uuid.dart';

class Memo {
  final String id = const Uuid().v4();
  final DateTime createdAt = DateTime.now();
  String title = '';
  String content = '';
  DateTime updatedAt = DateTime.now();
  bool isDeleted = false;
  bool isFavorite = false;

  Memo({required this.title, required this.content, DateTime? updatedAt}) {
    if (updatedAt != null) {
      this.updatedAt = updatedAt;
    }
  }

  bool isEmpty() {
    return title.isEmpty && content.isEmpty;
  }
}
