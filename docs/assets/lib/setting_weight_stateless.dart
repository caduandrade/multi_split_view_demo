import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/example_widget.dart';

class SettingWeightStatelessExample extends Example {
  @override
  Widget buildMainWidget(BuildContext context) => MainWidget();
}

class MainWidget extends StatelessWidget with ContentBuilder {
  @override
  Widget build(BuildContext context) {
    Widget child1 = buildContent(1);
    Widget child2 = buildContent(2);
    Widget child3 = buildContent(3);

    // setting 10% of weight for the first child
    MultiSplitView multiSplitView = MultiSplitView(
        children: [child1, child2, child3], initialAreas: [Area(weight: 0.1)]);

    return multiSplitView;
  }
}
