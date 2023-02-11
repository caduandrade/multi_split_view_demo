import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class MinimalWeightsExample extends Example {
  MinimalWeightsExample()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/minimal_weights.dart');
}

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MainWidget> with ContentBuilder {
  MultiSplitViewController _controller = MultiSplitViewController(
      areas: [Area(minimalWeight: .25), Area(minimalWeight: .25)]);

  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);

    MultiSplitView multiSplitView =
        MultiSplitView(children: [child1, child2], controller: _controller);

    return multiSplitView;
  }
}
