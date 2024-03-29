import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class HorizontalVerticalExample extends Example {
  HorizontalVerticalExample()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/horizontal_vertical.dart');
}

class MainWidget extends StatelessWidget with ContentBuilder {
  MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);
    Widget child3 = buildContent(3);
    Widget child4 = buildContent(4);

    MultiSplitView multiSplitView =
        MultiSplitView(axis: Axis.vertical, children: [
      MultiSplitView(children: [child1, child2, child3]),
      child4
    ]);

    return multiSplitView;
  }
}
