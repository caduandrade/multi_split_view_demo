import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/areas_table.dart';
import 'package:multi_split_view_demo/macros.dart';

class ZeroFlexPage extends DemoFluPage {
  //@demoflu_start:controller
  MultiSplitViewController controller = MultiSplitViewController(areas: [
    Area(size: 100, data: 'A'),
    Area(flex: 0, data: 'B'),
    Area(flex: 0, max: 2, data: 'C')
  ]);
  //@demoflu_end:controller

  List<Area> initialAreas = [
    Area(size: 100, data: 'A'),
    Area(flex: 0, data: 'B'),
    Area(flex: 0, max: 2, data: 'C')
  ];

  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();
    sections.text()
      ..add('If the total flex of the areas is 0, each flex will')
      ..add(' be changed to 1.');

    sections.warningBanner(text: 'The max value will be reset to null.');

    sections.code('lib/inconsistency_resolution/zero_flex/zero_flex_page.dart',
        mark: 'controller',
        loadMode: LoadMode.readOnlyMarked,
        title: 'total flex 0');

    sections.widget((context) => AreasTable.fromAreas(initialAreas));

    sections
        .text(text: 'after setting or updating areas on the controller')
        .runMacro(id: Macros.textAfter, context: context);

    sections.widget((context) => AreasTable.fromController(controller));

    return sections;
  }
}
