import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/examples/example_widget.dart';

class ProgrammaticallyExample extends Example {
  ProgrammaticallyExample() : super(widget: MainWidget(),codeFile: 'lib/examples/add_remove.dart');
}

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MainWidget> with ContentBuilder {
  MultiSplitViewController _controller = MultiSplitViewController();

  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);
    Widget child3 = Container(
        child: Center(
            child: ElevatedButton(child: Text('Change'), onPressed: _change)),
        color: Colors.yellow);

    MultiSplitView multiSplitView = MultiSplitView(
        children: [child1, child2, child3], controller: _controller);

    return multiSplitView;
  }

  void _change() {
    _controller.areas = [Area(size: 150)];
  }
}
