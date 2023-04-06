import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/memo_model.dart';
import 'memo_edit_page.dart';
import '../views/memo_list_view.dart';

class DeletedMemosPage extends StatelessWidget {
  const DeletedMemosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final memoModel = Provider.of<MemoModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo App'),
      ),
      body: MemoListView(
        memos: memoModel.deletedMemos,
        onMemoTapped: (memo) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MemoEditPage(memo: memo),
            ),
          );
        },
        onRestoreTapped: (memo) {
          memoModel.restoreMemo(memo);
        },
        onDeletePermanentlyTapped: (memo) {
          memoModel.deleteMemoPermanently(memo);
        },
        onFavoriteTapped: (memo) {
          memoModel.toggleFavorite(memo);
        },
      ),
    );
  }
}
