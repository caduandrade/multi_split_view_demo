import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class DividerHighlightedColorExample extends Example {
  DividerHighlightedColorExample()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/divider_highlighted_color.dart');
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
            dividerPainter: DividerPainters.background(
                animationEnabled: false,
                color: Colors.grey[200],
                highlightedColor: Colors.grey[800])));

    return theme;
  }
}
