import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

class PainterFromScratchExample extends StatelessWidget {
  const PainterFromScratchExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MultiSplitView multiSplitView = MultiSplitView(initialAreas: [
      Area(builder: (context, area) => Draft.blue()),
      Area(builder: (context, area) => Draft.yellow()),
      Area(builder: (context, area) => Draft.green())
    ]);

    MultiSplitViewTheme theme = MultiSplitViewTheme(
        data: MultiSplitViewThemeData(dividerPainter: MyDividerPainter()),
        child: multiSplitView);

    return theme;
  }
}

class MyDividerPainter extends DividerPainter {
  final int _colorKey = 1;

  @override
  Map<int, Tween> buildTween() {
    Map<int, Tween> map = super.buildTween();
    // create your tween here, example:
    map[_colorKey] = ColorTween(begin: Colors.blue, end: Colors.green);
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
    Color color = Colors.blue;
    if (animationEnabled && animatedValues.containsKey(_colorKey)) {
      color = animatedValues[_colorKey];
    }

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = 2
      ..isAntiAlias = true;
    canvas.drawLine(
        Offset.zero, Offset(dividerSize.width, dividerSize.height), paint);
  }
}
