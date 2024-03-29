import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class ResizableExample extends Example {
  ResizableExample()
      : super(widget: MainWidget(), codeFile: 'lib/examples/resizable.dart');
}

class MainWidget extends StatelessWidget with ContentBuilder {
  MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);
    Widget child3 = buildContent(3);

    MultiSplitView multiSplitView =
        MultiSplitView(children: [child1, child2, child3], resizable: false);

    return multiSplitView;
  }
}
