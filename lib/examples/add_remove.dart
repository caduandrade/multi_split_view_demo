import 'dart:math' as math;

import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class AddRemoveExample extends Example {
  AddRemoveExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/add_remove.dart');
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> with ContentBuilder {
  final MultiSplitViewController _controller = MultiSplitViewController();
  int _count = 3;

  @override
  Widget build(BuildContext context) {
    Widget buttons = Padding(
        padding: const EdgeInsets.all(8),
        child: Row(children: [
          ElevatedButton(onPressed: _onAdd, child: const Text('Add')),
          const SizedBox(width: 8),
          ElevatedButton(onPressed: _onRemove, child: const Text('Remove'))
        ]));

    List<Widget> children = [];
    for (int i = 0; i < _count; i++) {
      children.add(buildContent(i + 1));
    }

    MultiSplitView multiSplitView =
        MultiSplitView(controller: _controller, children: children);

    return Column(children: [buttons, Expanded(child: multiSplitView)]);
  }

  void _onAdd() {
    setState(() {
      _count++;
    });
  }

  void _onRemove() {
    setState(() {
      _count = math.max(0, _count - 1);
    });
  }
}
