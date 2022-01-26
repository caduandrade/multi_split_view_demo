import 'dart:math' as math;
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/example_widget.dart';

class AddRemoveExample extends Example {
  @override
  Widget buildMainWidget(BuildContext context) => MainWidget();
}

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> with ContentBuilder {
  MultiSplitViewController _controller = MultiSplitViewController();
  int _count = 3;

  @override
  Widget build(BuildContext context) {
    Widget buttons = Padding(
        child: Row(children: [
          ElevatedButton(onPressed: _onAdd, child: Text('Add')),
          SizedBox(width: 8),
          ElevatedButton(onPressed: _onRemove, child: Text('Remove'))
        ]),
        padding: EdgeInsets.all(8));

    List<Widget> children = [];
    for (int i = 0; i < _count; i++) {
      children.add(buildContent(i + 1));
    }

    MultiSplitView multiSplitView =
        MultiSplitView(children: children, controller: _controller);

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
