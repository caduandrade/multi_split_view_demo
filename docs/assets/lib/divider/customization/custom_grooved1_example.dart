import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';

class CustomGrooved1Example extends StatelessWidget {
  const CustomGrooved1Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //@demoflu_start:show
    MultiSplitView multiSplitView = MultiSplitView(initialAreas: [
      Area(builder: (context, area) => Draft.blue()),
      Area(builder: (context, area) => Draft.yellow()),
      Area(builder: (context, area) => Draft.green())
    ]);

    MultiSplitViewTheme theme = MultiSplitViewTheme(
        data: MultiSplitViewThemeData(
            dividerPainter: DividerPainters.grooved1(
                size: 5,
                highlightedSize: 30,
                thickness: 3,
                highlightedThickness: 6)),
        child: multiSplitView);
    //@demoflu_end:show

    return theme;
  }
}
