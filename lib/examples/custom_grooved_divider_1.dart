import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class CustomGroovedDivider1Example extends Example {
  CustomGroovedDivider1Example()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/custom_grooved_divider_1.dart');
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
            dividerPainter: DividerPainters.grooved1(
                size: 5,
                highlightedSize: 30,
                thickness: 3,
                highlightedThickness: 6)),
        child: multiSplitView);

    return theme;
  }
}
