import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/macros.dart';

class ResizablePage extends DemoFluPage {
  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();
    sections.text()
      ..add('You can turn off resizing on the entire Widget')
      ..add(' with the "resizable" attribute.');

    sections
        .widget((context) => const Example())
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.code('lib/resizable/resizable_page.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    return sections;
  }
}

//@demoflu_start:show
class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSplitView(resizable: false, initialAreas: [
      Area(builder: (context, area) => Draft.blue()),
      Area(builder: (context, area) => Draft.yellow()),
      Area(builder: (context, area) => Draft.green())
    ]);
  }
}
//@demoflu_end:show
