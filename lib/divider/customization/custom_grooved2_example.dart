import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';

class CustomGrooved2Example extends StatelessWidget {
  const CustomGrooved2Example({Key? key}) : super(key: key);

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
                gap: 15,
                thickness: 4,
                count: 3,
                highlightedCount: 9,
                strokeCap: StrokeCap.square)),
        child: multiSplitView);
    //@demoflu_end:show

    return theme;
  }
}
