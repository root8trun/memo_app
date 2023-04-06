import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/memo_model.dart';
import '../models/memo.dart';

class MemoEditPage extends StatefulWidget {
  const MemoEditPage({
    super.key,
    required this.memo,
  });

  final Memo memo;
  @override
  State<MemoEditPage> createState() => _MemoEditPageState();
}

class _MemoEditPageState extends State<MemoEditPage> {
  final TextEditingController _titleController;
  final TextEditingController _contentController;

  _MemoEditPageState()
      : _titleController = TextEditingController(),
        _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.memo.title;
    _contentController.text = widget.memo.content;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _handleSave() {
    widget.memo.title = _titleController.text;
    widget.memo.content = _contentController.text;
    widget.memo.updatedAt = DateTime.now();

    final memoModel = Provider.of<MemoModel>(context, listen: false);
    // aIf there is no one with the same memo ID in MemoModel, add a new one.
    if (memoModel.memos.indexWhere((memo) => memo.id == widget.memo.id) == -1) {
      memoModel.addMemo(widget.memo);
    } else {
      memoModel.updateMemo(widget.memo);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _handleSave,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter the title',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Content',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the content',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                keyboardType: TextInputType.multiline,
                minLines: null,
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
