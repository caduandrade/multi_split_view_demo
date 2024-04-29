import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

class HorizontalExample extends StatelessWidget {
  const HorizontalExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSplitView(initialAreas: [
      Area(widget: Draft.blue()),
      Area(widget: Draft.yellow()),
      Area(widget: Draft.green())
    ]);
  }
}
