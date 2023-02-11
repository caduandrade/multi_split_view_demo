import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class SettingWeightStatefulExample extends Example {
  SettingWeightStatefulExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/setting_weight_stateful.dart');
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MainWidget> with ContentBuilder {
  MultiSplitViewController _controller =
      MultiSplitViewController(areas: [Area(weight: 0.1)]);
  MultiSplitViewController _controller2 =
      MultiSplitViewController(areas: Area.weights([0.1]));

  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);
    Widget child3 = buildContent(3);

    // setting 10% of weight for the first child
    MultiSplitView multiSplitView = MultiSplitView(
        children: [child1, child2, child3], controller: _controller);

    return multiSplitView;
  }
}
