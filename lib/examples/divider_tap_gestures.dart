import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class DividerTapGesturesExample extends Example {
  DividerTapGesturesExample()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/divider_tap_gestures.dart',
            consoleEnabled: true);
}

class MainWidget extends StatelessWidget with ContentBuilder {
  MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);
    Widget child3 = buildContent(3);
    Widget child4 = buildContent(4);

    MultiSplitView multiSplitView = MultiSplitView(
        children: [child1, child2, child3, child4],
        onDividerTap: (dividerIndex) => _onTap(context, dividerIndex),
        onDividerDoubleTap: (dividerIndex) =>
            _onDoubleTap(context, dividerIndex));

    return multiSplitView;
  }

  void _onTap(BuildContext context, int dividerIndex) {
    DemoFlu.printOnConsole(context, 'Tap: $dividerIndex');
  }

  void _onDoubleTap(BuildContext context, int dividerIndex) {
    DemoFlu.printOnConsole(context, 'Double tap: $dividerIndex');
  }
}
