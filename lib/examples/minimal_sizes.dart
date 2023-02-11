import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class MinimalSizesExample extends Example {
  MinimalSizesExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/minimal_sizes.dart');
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MainWidget> with ContentBuilder {
  final MultiSplitViewController _controller =
      MultiSplitViewController(areas: [Area(minimalSize: 150)]);

  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);

    MultiSplitView multiSplitView =
        MultiSplitView(controller: _controller, children: [child1, child2]);

    return multiSplitView;
  }
}
