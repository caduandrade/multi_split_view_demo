import 'dart:math' as math;
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/example_widget.dart';

class AddRemoveExample extends StatefulWidget {
  const AddRemoveExample(this.buttonClickNotifier);

  // demoflu notifier
  final ButtonClickNotifier buttonClickNotifier;

  @override
  State<StatefulWidget> createState() => AddRemoveExampleState();
}

class AddRemoveExampleState extends State<AddRemoveExample>
    with ContentBuilder {
  MultiSplitViewController _controller = MultiSplitViewController();
  int _count = 3;

  @override
  void initState() {
    super.initState();
    widget.buttonClickNotifier.register(_onButtonClick);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < _count; i++) {
      children.add(buildContent(i + 1));
    }

    MultiSplitView multiSplitView =
        MultiSplitView(children: children, controller: _controller);

    return multiSplitView;
  }

  void _onButtonClick(int buttonIndex) {
    setState(() {
      if (buttonIndex == 0) {
        _count++;
      } else if (buttonIndex == 1) {
        _count = math.max(0, _count - 1);
      }
    });
  }
}
