import 'dart:math' as math;
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/example_widget.dart';

class AddRemoveExample extends ExampleStateful {
  AddRemoveExample(ExampleMenuNotifier menuNotifier)
      : super(menuNotifier: menuNotifier);

  @override
  State<StatefulWidget> createState() => AddRemoveExampleState();

  @override
  List<ExampleMenuWidget> menuWidgets() {
    return [MenuButton(id: 1, name: 'Add'), MenuButton(id: 2, name: 'Remove')];
  }
}

class AddRemoveExampleState extends ExampleStatefulState<AddRemoveExample>
    with ContentBuilder {
  MultiSplitViewController _controller = MultiSplitViewController();
  int _count = 3;

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

  @override
  void onButtonClick(int buttonId) {
    setState(() {
      if (buttonId == 1) {
        _count++;
      } else if (buttonId == 2) {
        _count = math.max(0, _count - 1);
      }
    });
  }
}
