import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

class Grooved2Example extends StatelessWidget {
  const Grooved2Example({Key? key}) : super(key: key);

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
            dividerPainter: DividerPainters.grooved2(
                color: Colors.grey[400]!, highlightedColor: Colors.red)),
        child: multiSplitView);
    //@demoflu_end:show

    return theme;
  }
}
