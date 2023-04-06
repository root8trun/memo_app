import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/memo_model.dart';
import 'memo_edit_page.dart';
import '../views/memo_list_view.dart';

class FavoriteMemosPage extends StatelessWidget {
  const FavoriteMemosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final memoModel = Provider.of<MemoModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo App'),
      ),
      body: MemoListView(
        memos: memoModel.favoriteMemos,
        onMemoTapped: (memo) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MemoEditPage(memo: memo),
            ),
          );
        },
        onDeleteTapped: (memo) {
          memoModel.deleteMemo(memo);
        },
        onFavoriteTapped: (memo) {
          memoModel.toggleFavorite(memo);
        },
      ),
    );
  }
}
