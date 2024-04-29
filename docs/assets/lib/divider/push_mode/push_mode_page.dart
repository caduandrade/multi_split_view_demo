import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/areas_table.dart';
import 'package:multi_split_view_demo/macros.dart';

class PushModePage extends DemoFluPage {
  final AllFlex _allFlex = AllFlex();
  final SizedAreas _sizedAreas = SizedAreas();

  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();
    sections.text(text: 'Allows the divider to push the others.');

    sections.code('lib/divider/push_mode/push_mode_page.dart',
        mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections.heading('Flex');

    sections
        .widget((context) => _allFlex.build())
        .runMacro(id: Macros.horizontalExample, context: context);
    sections
        .widget((context) => AreasTable.fromController(_allFlex.controller));

    sections.heading('Size');

    sections
        .widget((context) => _sizedAreas.build())
        .runMacro(id: Macros.horizontalExample, context: context);
    sections
        .widget((context) => AreasTable.fromController(_sizedAreas.controller));

    return sections;
  }
}

class AllFlex {
  final MultiSplitViewController controller = MultiSplitViewController(areas: [
    Area(widget: Draft.blue(), data: 'blue'),
    Area(widget: Draft.yellow(), data: 'yellow'),
    Area(widget: Draft.green(), data: 'green')
  ]);

  Widget build() {
    //@demoflu_start:code
    MultiSplitView multiSplitView =
        MultiSplitView(pushDividers: true, controller: controller);
    //@demoflu_end:code

    return MultiSplitViewTheme(
        data:
            MultiSplitViewThemeData(dividerPainter: DividerPainters.grooved2()),
        child: multiSplitView);
  }
}

class SizedAreas {
  final MultiSplitViewController controller = MultiSplitViewController(areas: [
    Area(size: 100, widget: Draft.blue(), data: 'blue'),
    Area(size: 100, widget: Draft.yellow(), data: 'yellow'),
    Area(widget: Draft.green(), data: 'green')
  ]);

  Widget build() {
    MultiSplitView multiSplitView =
        MultiSplitView(pushDividers: true, controller: controller);

    return MultiSplitViewTheme(
        data:
            MultiSplitViewThemeData(dividerPainter: DividerPainters.grooved2()),
        child: multiSplitView);
  }
}
