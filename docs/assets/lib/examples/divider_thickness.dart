import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class DividerThicknessExample extends Example {
  DividerThicknessExample()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/divider_thickness.dart');
}

class MainWidget extends StatelessWidget with ContentBuilder {
  MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);
    Widget child3 = buildContent(3);

    MultiSplitView multiSplitView =
        MultiSplitView(children: [child1, child2, child3]);

    MultiSplitViewTheme theme = MultiSplitViewTheme(
        child: multiSplitView,
        data: MultiSplitViewThemeData(dividerThickness: 30));

    return theme;
  }
}
