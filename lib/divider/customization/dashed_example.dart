import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

class DashedExample extends StatelessWidget {
  const DashedExample({Key? key}) : super(key: key);

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
            dividerPainter: DividerPainters.dashed(
                color: Colors.deepOrange, highlightedColor: Colors.black)),
        child: multiSplitView);
    //@demoflu_end:show

    return theme;
  }
}
