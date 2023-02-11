import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class SizeListenerExample extends Example {
  SizeListenerExample()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/listener.dart',
            consoleEnabled: true);
}

class MainWidget extends StatelessWidget with ContentBuilder {
  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);
    Widget child3 = buildContent(3);
    Widget child4 = buildContent(4);

    MultiSplitView multiSplitView = MultiSplitView(
        children: [child1, child2, child3, child4],
        onWeightChange: () =>
            DemoFlu.printOnConsole(context, 'Weight has changed'));

    return multiSplitView;
  }
}
