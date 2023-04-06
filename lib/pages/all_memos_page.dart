import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/memo.dart';
import '../models/memo_model.dart';
import 'memo_edit_page.dart';
import 'deleted_memos_page.dart';
import '../views/memo_list_view.dart';
import 'favorite_memos_page.dart';

class AllMemosPage extends StatelessWidget {
  const AllMemosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final memoModel = Provider.of<MemoModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Memo App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('All Memos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite Memos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoriteMemosPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Deleted Memos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeletedMemosPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MemoEditPage(
                memo: Memo(title: "", content: ""),
              ),
            ),
          );
        },
      ),
      body: MemoListView(
        memos: memoModel.memos,
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
