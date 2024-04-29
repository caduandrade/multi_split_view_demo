import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

//@demoflu_start:show
class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  final MultiSplitViewController _controller = MultiSplitViewController(areas: [
    Area(builder: (context) => Draft.blue()),
    Area(builder: (context) => Draft.yellow()),
    Area(builder: (context) => Draft.green())
  ]);

  @override
  Widget build(BuildContext context) {
    return MultiSplitView(controller: _controller);
  }
}
//@demoflu_end:show
