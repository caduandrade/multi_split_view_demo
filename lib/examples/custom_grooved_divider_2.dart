import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class CustomGroovedDivider2Example extends Example {
  CustomGroovedDivider2Example() : super(widget: MainWidget(),codeFile: 'lib/examples/custom_grooved_divider_2.dart');
}

class MainWidget extends StatelessWidget with ContentBuilder {
  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);

    MultiSplitView multiSplitView = MultiSplitView(children: [child1, child2]);

    MultiSplitViewTheme theme = MultiSplitViewTheme(
        child: multiSplitView,
        data: MultiSplitViewThemeData(
            dividerPainter: DividerPainters.grooved2(
                gap: 15,
                thickness: 4,
                count: 3,
                highlightedCount: 9,
                strokeCap: StrokeCap.square)));

    return theme;
  }
}
