import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

class CombineExample extends StatelessWidget {
  const CombineExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSplitView(axis: Axis.vertical, initialAreas: [
      Area(
          widget: MultiSplitView(initialAreas: [
        Area(widget: Draft.blue()),
        Area(widget: Draft.yellow()),
        Area(widget: Draft.green())
      ])),
      Area(widget: Draft.orange())
    ]);
  }
}
