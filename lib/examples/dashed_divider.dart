import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class DashedDividerExample extends Example {
  DashedDividerExample()
      : super(
            widget: MainWidget(), codeFile: 'lib/examples/dashed_divider.dart');
}

class MainWidget extends StatelessWidget with ContentBuilder {
  MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);

    MultiSplitView multiSplitView = MultiSplitView(children: [child1, child2]);

    MultiSplitViewTheme theme = MultiSplitViewTheme(
        data: MultiSplitViewThemeData(
            dividerPainter: DividerPainters.dashed(
                color: Colors.deepOrange, highlightedColor: Colors.black)),
        child: multiSplitView);

    return theme;
  }
}
