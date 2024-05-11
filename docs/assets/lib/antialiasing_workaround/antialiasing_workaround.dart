import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/macros.dart';

class AntialiasingWorkaroundPage extends DemoFluPage {
  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();

    sections.text()
      ..add('Flutter has some problems with drawing straight lines.')
      ..add(' Example: https://github.com/flutter/flutter/issues/14288');

    sections.text()
      ..add('An alternative solution to minimize the problem is to round')
      ..add(' the coordinates to integer values. As a side effect, some areas')
      ..add(' may stretch or shrink slightly as the divider is dragged.');

    sections.heading('Workaround off');
    sections.code('lib/antialiasing_workaround/antialiasing_workaround.dart',
        mark: 'off', loadMode: LoadMode.readOnlyMarked);
    sections
        .widget(_workaroundOff)
        .runMacro(id: Macros.horizontalExample, context: context);
    sections.heading('Workaround on');
    sections.code('lib/antialiasing_workaround/antialiasing_workaround.dart',
        mark: 'on', loadMode: LoadMode.readOnlyMarked);
    sections
        .widget(_workaroundOn)
        .runMacro(id: Macros.horizontalExample, context: context);
    return sections;
  }

  Widget _workaroundOff(BuildContext context) {
    //@demoflu_start:off
    MultiSplitView view = MultiSplitView(initialAreas: [
      Area(builder: (context, area) => Draft.blue()),
      Area(builder: (context, area) => Draft.yellow()),
      Area(builder: (context, area) => Draft.green()),
      Area(builder: (context, area) => Draft.orange())
    ]);
    //@demoflu_end:off
    return view;
  }

  Widget _workaroundOn(BuildContext context) {
    //@demoflu_start:on
    MultiSplitView view =
        MultiSplitView(antiAliasingWorkaround: true, initialAreas: [
      Area(builder: (context, area) => Draft.blue()),
      Area(builder: (context, area) => Draft.yellow()),
      Area(builder: (context, area) => Draft.green()),
      Area(builder: (context, area) => Draft.orange())
    ]);
    //@demoflu_end:on
    return view;
  }
}
