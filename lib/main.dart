import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/memo_model.dart';
import 'pages/all_memos_page.dart';
import 'models/setting_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MemoModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => SettingModel(),
      ),
    ],
    child: const MemoApp(),
  ));
}

class MemoApp extends StatelessWidget {
  const MemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingModel = Provider.of<SettingModel>(context);
    return MaterialApp(
      title: 'Memo App',

      /*
      theme: ThemeData(
        useMaterial3: false,
        //primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      */
      theme: settingModel.themeData,
      home: const AllMemosPage(),
    );
  }
}
