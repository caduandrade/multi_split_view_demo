import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/example_widget.dart';

class DividerPainterFromScratchExample extends StatelessWidget
    with ContentBuilder {
  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);

    MultiSplitView multiSplitView = MultiSplitView(children: [child1, child2]);

    MultiSplitViewTheme theme = MultiSplitViewTheme(
        child: multiSplitView,
        data: MultiSplitViewThemeData(dividerPainter: MyDividerPainter()));

    return theme;
  }
}

class MyDividerPainter extends DividerPainter {
  @override
  Map<int, Tween> buildTween() {
    Map<int, Tween> map = super.buildTween();
    // create your tween here, example:
    map[100] = Tween<double>(begin: 1, end: 5);
    return map;
  }

  @override
  void paint(
      {required Axis dividerAxis,
      required bool resizable,
      required bool highlighted,
      required Canvas canvas,
      required Size dividerSize,
      required Map<int, dynamic> animatedValues}) {
    super.paint(
        dividerAxis: dividerAxis,
        resizable: resizable,
        highlighted: highlighted,
        canvas: canvas,
        dividerSize: dividerSize,
        animatedValues: animatedValues);
    double myAnimatedValue = animatedValues[100];
    // ...
  }
}
