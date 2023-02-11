import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class VerticalExample extends Example {
  VerticalExample() : super(widget: MainWidget(),codeFile: 'lib/examples/vertical.dart');
}

class MainWidget extends StatelessWidget with ContentBuilder {
  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);

    MultiSplitView multiSplitView =
        MultiSplitView(axis: Axis.vertical, children: [child1, child2]);

    return multiSplitView;
  }
}
