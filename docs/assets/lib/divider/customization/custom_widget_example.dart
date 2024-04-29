import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

class CustomWidgetExample extends StatelessWidget {
  const CustomWidgetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //@demoflu_start:show
    MultiSplitView multiSplitView = MultiSplitView(
        initialAreas: [
          Area(widget: Draft.blue()),
          Area(widget: Draft.yellow()),
          Area(widget: Draft.green())
        ],
        dividerBuilder:
            (axis, index, resizable, dragging, highlighted, themeData) {
          return Container(
            color: dragging ? Colors.teal[300] : Colors.teal[100],
            child: Icon(
              Icons.drag_indicator,
              color: highlighted ? Colors.teal[600] : Colors.teal[400],
            ),
          );
        });

    MultiSplitViewTheme theme = MultiSplitViewTheme(
        data: MultiSplitViewThemeData(dividerThickness: 24),
        child: multiSplitView);
    //@demoflu_end:show

    return theme;
  }
}
