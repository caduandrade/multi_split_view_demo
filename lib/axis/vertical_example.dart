import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

class VerticalExample extends StatelessWidget {
  const VerticalExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSplitView(axis: Axis.vertical, initialAreas: [
      Area(widget: Draft.blue()),
      Area(widget: Draft.yellow()),
      Area(widget: Draft.green())
    ]);
  }
}
