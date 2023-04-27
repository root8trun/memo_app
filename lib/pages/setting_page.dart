import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/setting_model.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Change theme color'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Select a color'),
                    content: SingleChildScrollView(
                      child: BlockPicker(
                        pickerColor: Theme.of(context).colorScheme.primary,
                        onColorChanged: (Color color) {
                          Provider.of<SettingModel>(context, listen: false)
                              .changeColor(
                                  ColorScheme.fromSeed(seedColor: color));
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            title: Text('Change font size'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Select a font size'),
                    content: SingleChildScrollView(
                      child: Slider(
                        value: Provider.of<SettingModel>(context, listen: false)
                            .fontSize,
                        min: 10.0,
                        max: 30.0,
                        onChanged: (double newValue) {
                          Provider.of<SettingModel>(context, listen: false)
                              .updateFontSize(newValue);
                          //Navigator.pop(context);
                          //Provider.of<SettingModel>(context, listen: false)
                          //    .updateFontSize2(Theme.of(context)
                          //        .textTheme
                          //        .apply(fontSizeFactor: newValue / 16.0));
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
