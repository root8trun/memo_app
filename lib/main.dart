import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/memo_model.dart';
import 'pages/all_memos_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MemoModel(),
      child: const MemoApp(),
    ),
  );
}

class MemoApp extends StatelessWidget {
  const MemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AllMemosPage(),
    );
  }
}
