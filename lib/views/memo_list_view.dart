import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/memo.dart';
import '../widgets/memo_tile.dart';

class MemoListView extends StatefulWidget {
  final List<Memo> memos;
  final Function(Memo) onMemoTapped;
  final Function(Memo) onFavoriteTapped;
  final Function(Memo)? onDeleteTapped;
  final Function(Memo)? onRestoreTapped;
  final Function(Memo)? onDeletePermanentlyTapped;

  const MemoListView({
    super.key,
    required this.memos,
    required this.onMemoTapped,
    required this.onFavoriteTapped,
    this.onDeleteTapped,
    this.onRestoreTapped,
    this.onDeletePermanentlyTapped,
  });

  @override
  State<MemoListView> createState() => _MemoListViewState();
}

class _MemoListViewState extends State<MemoListView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.memos.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Slidable(
              key: UniqueKey(),
              endActionPane: ActionPane(
                extentRatio: 0.2,
                motion: const ScrollMotion(),
                children: [
                  if (widget.onDeleteTapped != null)
                    SlidableAction(
                      onPressed: (context) async {
                        widget.onDeleteTapped!(widget.memos[index]);
                      },
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  if (widget.onRestoreTapped != null)
                    SlidableAction(
                      onPressed: (context) async {
                        widget.onRestoreTapped!(widget.memos[index]);
                      },
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      icon: Icons.restore,
                      label: 'Restore',
                    ),
                  if (widget.onDeletePermanentlyTapped != null)
                    SlidableAction(
                      onPressed: (context) async {
                        widget.onDeletePermanentlyTapped!(widget.memos[index]);
                      },
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      icon: Icons.delete_forever,
                      label: 'Delete Permanently',
                    ),
                ],
              ),
              child: InkWell(
                child: MemoTile(
                  memo: widget.memos[index],
                  onTap: () {
                    widget.onMemoTapped(widget.memos[index]);
                  },
                  onFavoriteTapped: () {
                    widget.onFavoriteTapped(widget.memos[index]);
                  },
                ),
              ),
            ),
            const Divider(height: 0),
          ],
        );
      },
    );
  }
}
