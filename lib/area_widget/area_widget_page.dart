import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

class AreaWidgetPage extends DemoFluPage {
  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();

    sections.text(text: 'There are two options to set the area widget.');

    sections.heading('Area builder attribute');

    sections.code('lib/area_widget/area_builder_attribute_example.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    sections.heading('MultiSplitView builder attribute');

    sections.code('lib/area_widget/builder_attribute_example.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    return sections;
  }
}

//@demoflu_start:show
class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ExampleState();
}

class ExampleState extends State<Example> {
  final MultiSplitViewController _controller = MultiSplitViewController(areas: [
    Area(builder: (context, area) => Draft.blue()),
    Area(builder: (context, area) => Draft.yellow()),
    Area(builder: (context, area) => Draft.green())
  ]);

  @override
  Widget build(BuildContext context) {
    return MultiSplitView(controller: _controller);
  }
}
//@demoflu_end:show
