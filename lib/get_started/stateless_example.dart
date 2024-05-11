import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

//@demoflu_start:show
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSplitView(initialAreas: [
      Area(builder: (context, area) => Draft.blue()),
      Area(builder: (context, area) => Draft.yellow()),
      Area(builder: (context, area) => Draft.green())
    ]);
  }
}
//@demoflu_end:show
