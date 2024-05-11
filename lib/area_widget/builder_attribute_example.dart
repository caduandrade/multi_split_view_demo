import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

//@demoflu_start:show
class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
  final MultiSplitViewController _controller = MultiSplitViewController(
      areas: [Area(data: 'blue'), Area(data: 'yellow'), Area(data: 'green')]);

  @override
  Widget build(BuildContext context) {
    return MultiSplitView(
        controller: _controller,
        builder: (context, area) {
          switch (area.data) {
            case 'blue':
              return Draft.blue();
            case 'yellow':
              return Draft.yellow();
            case 'green':
              return Draft.green();
            default:
              return Container();
          }
        });
  }
}
//@demoflu_end:show
