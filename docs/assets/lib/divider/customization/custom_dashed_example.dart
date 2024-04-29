import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';

class CustomDashedExample extends StatelessWidget {
  const CustomDashedExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //@demoflu_start:show
    MultiSplitView multiSplitView = MultiSplitView(initialAreas: [
      Area(widget: Draft.blue()),
      Area(widget: Draft.yellow()),
      Area(widget: Draft.green())
    ]);

    MultiSplitViewTheme theme = MultiSplitViewTheme(
        data: MultiSplitViewThemeData(
            dividerPainter: DividerPainters.dashed(
                gap: 20, size: 20, thickness: 3, highlightedThickness: 6)),
        child: multiSplitView);
    //@demoflu_end:show

    return theme;
  }
}
