import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/macros.dart';

class ListenerPageExample extends DemoFluPage {
  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();
    sections
        .widget((context) => const Example())
        .runMacro(id: Macros.horizontalExample, context: context);
    sections.console();
    sections.code('lib/divider/listener/listener_page.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    return sections;
  }
}

//@demoflu_start:show
class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MultiSplitView multiSplitView = MultiSplitView(initialAreas: [
      Area(builder: (context, area) => Draft.blue()),
      Area(builder: (context, area) => Draft.yellow()),
      Area(builder: (context, area) => Draft.green())
    ], onDividerDragUpdate: (index) => print('divider index: $index'));
    return multiSplitView;
  }
}
//@demoflu_end:show
