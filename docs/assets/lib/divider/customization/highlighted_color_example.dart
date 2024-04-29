import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

class HighlightedColorExample extends StatelessWidget {
  const HighlightedColorExample({Key? key}) : super(key: key);

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
            dividerPainter: DividerPainters.background(
                animationEnabled: false,
                color: Colors.grey[200],
                highlightedColor: Colors.grey[800])),
        child: multiSplitView);
    //@demoflu_end:show

    return theme;
  }
}
