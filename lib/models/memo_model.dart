import 'package:flutter/foundation.dart';
import 'memo.dart';

class MemoModel extends ChangeNotifier {
  final List<Memo> _memos = [];

  List<Memo> get memos => _memos.where((memo) => !memo.isDeleted).toList();
  List<Memo> get deletedMemos =>
      _memos.where((memo) => memo.isDeleted).toList();
  List<Memo> get favoriteMemos =>
      _memos.where((memo) => memo.isFavorite && !memo.isDeleted).toList();
  void addMemo(Memo memo) {
    if (memo.isEmpty()) {
      return;
    }
    _memos.add(memo);
    notifyListeners();
  }

  void updateMemo(Memo memo) {
    final index = _memos.indexWhere((m) => m.id == memo.id);
    _memos[index] = memo;
    notifyListeners();
  }

  void deleteMemo(Memo memo) {
    final index = _memos.indexWhere((m) => m.id == memo.id);
    _memos[index].isDeleted = true;
    notifyListeners();
  }

  void restoreMemo(Memo memo) {
    final index = _memos.indexWhere((m) => m.id == memo.id);
    _memos[index].isDeleted = false;
    notifyListeners();
  }

  void deleteMemoPermanently(Memo memo) {
    final index = _memos.indexWhere((m) => m.id == memo.id);
    _memos.removeAt(index);
    notifyListeners();
  }

  void toggleFavorite(Memo memo) {
    final index = _memos.indexWhere((m) => m.id == memo.id);
    _memos[index].isFavorite = !_memos[index].isFavorite;
    notifyListeners();
  }
}
