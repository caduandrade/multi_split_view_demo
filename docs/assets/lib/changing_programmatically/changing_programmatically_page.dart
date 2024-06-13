import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';

class ChangingProgrammaticallyPage extends DemoFluPage {
  final MultiSplitViewController _controller = MultiSplitViewController();

  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();

    sections.text()
      ..add('The id is used as an internal Key.')
      ..add(' It will never be null and must be unique in the layout.');

    sections.warningBanner()
      ..add('You need to reuse the id if you want to maintain the area')
      ..add(' state when reconfiguring areas in the controller.');

    sections.code(
        'lib/changing_programmatically/changing_programmatically_page.dart',
        mark: '1',
        loadMode: LoadMode.readOnlyMarked);

    sections.text(text: 'or');

    sections.code(
        'lib/changing_programmatically/changing_programmatically_page.dart',
        mark: '2',
        loadMode: LoadMode.readOnlyMarked);

    return sections;
  }

  void _changeAreas() {
    //@demoflu_start:1
    _controller.areas = [
      Area(id: 1, flex: 1, builder: (c, a) => Container()),
      Area(id: 2, flex: 2, builder: (c, a) => Container())
    ];
    //@demoflu_end:1

    //@demoflu_start:2
    dynamic oldId1 = _controller.areas[0].id;
    dynamic oldId2 = _controller.areas[1].id;
    _controller.areas = [
      Area(id: oldId1, flex: 1, builder: (c, a) => Container()),
      Area(id: oldId2, flex: 2, builder: (c, a) => Container())
    ];
    //@demoflu_end:2
  }
}
