import 'package:flutter/material.dart';

class MeasureView extends StatelessWidget {
  const MeasureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(children: [
        Expanded(
            child: Container(
                decoration: const BoxDecoration(
                    border:
                        Border(left: BorderSide(color: Colors.grey, width: 1))),
                child: const Divider(thickness: 1, color: Colors.grey))),
        Flexible(
            flex: 0,
            child: Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Text('${constraints.maxWidth}'))),
        Expanded(
            child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.grey, width: 1))),
                child: const Divider(thickness: 1, color: Colors.grey)))
      ]);
    });
  }
}
