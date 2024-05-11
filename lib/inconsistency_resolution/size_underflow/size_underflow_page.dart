import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/areas_table.dart';
import 'package:multi_split_view_demo/macros.dart';
import 'package:multi_split_view_demo/measure_view.dart';

class SizeUnderflowPage extends DemoFluPage {
  //@demoflu_start:controller
  MultiSplitViewController controller = MultiSplitViewController(areas: [
    Area(size: 100, builder: (context, area) => Draft.blue(), data: 'blue'),
    Area(size: 100, builder: (context, area) => Draft.yellow(), data: 'yellow'),
    Area(
        size: 50,
        max: 100,
        builder: (context, area) => Draft.green(),
        data: 'green')
  ]);
  //@demoflu_end:controller

  final List<Area> _initialAreas = [
    Area(size: 100, builder: (context, area) => Draft.blue(), data: 'blue'),
    Area(size: 100, builder: (context, area) => Draft.yellow(), data: 'yellow'),
    Area(
        size: 50,
        max: 100,
        builder: (context, area) => Draft.green(),
        data: 'green')
  ];

  //@demoflu_start:controller2
  MultiSplitViewController controller2 = MultiSplitViewController(areas: [
    Area(size: 100, builder: (context, area) => Draft.blue(), data: 'blue'),
    Area(size: 100, builder: (context, area) => Draft.yellow(), data: 'yellow'),
    Area(
        size: 50,
        max: 100,
        builder: (context, area) => Draft.green(),
        data: 'green')
  ]);
  //@demoflu_end:controller2

  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();
    sections.text()
      ..add('When the total area size is smaller than the available space and')
      ..add(' there is no flex area to fill that space,')
      ..add(' it is necessary to stretch according to the policy.');

    sections.warningBanner(
        text: 'Stretching will occur even if the maximum limit is set.');

    sections.code(
        'lib/inconsistency_resolution/size_underflow/size_underflow_page.dart',
        mark: 'controller',
        loadMode: LoadMode.readOnlyMarked,
        title: 'overflow areas');

    sections.widget((context) => AreasTable.fromAreas(_initialAreas));

    sections.code(
        'lib/inconsistency_resolution/size_underflow/size_underflow_page.dart',
        mark: 'view',
        loadMode: LoadMode.readOnlyMarked,
        title: '3 children');

    sections
        .text(text: 'after widget layout')
        .runMacro(id: Macros.textAfter, context: context);

    sections.widget((context) => const MeasureView())
      ..padding = const EdgeInsets.only(left: 10, right: 10)
      ..maxWidth = 500
      ..marginBottom = 4;
    sections
        .widget((context) => build())
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.widget((context) => AreasTable.fromController(controller));

    sections.infoBanner()
      ..add('“green” can shrink, but not stretch, as it is already above')
      ..add('the maximum.');

    sections.heading('Underflow policy');

    sections.text()
      ..add('You can change the resizing policy by')
      ..add(' setting SizeUnderflowPolicy.');

    sections.text(text: 'There are the following options:');

    sections.bulletsSection()
      ..create(text: 'stretchFirst')
      ..create(text: 'stretchLast (default)')
      ..create(text: 'stretchAll');

    sections.code(
        'lib/inconsistency_resolution/size_underflow/size_underflow_page.dart',
        mark: 'controller2',
        loadMode: LoadMode.readOnlyMarked,
        title: 'underflow areas');

    sections.code(
        'lib/inconsistency_resolution/size_underflow/size_underflow_page.dart',
        mark: 'view2',
        loadMode: LoadMode.readOnlyMarked,
        title: '3 children');

    sections
        .text(text: 'after widget layout')
        .runMacro(id: Macros.textAfter, context: context);

    sections.widget((context) => const MeasureView())
      ..padding = const EdgeInsets.only(left: 10, right: 10)
      ..maxWidth = 500
      ..marginBottom = 4;
    sections
        .widget((context) => build2())
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.widget((context) => AreasTable.fromController(controller2));

    return sections;
  }

  Widget build() {
    //@demoflu_start:view
    MultiSplitView view =
        MultiSplitView(resizable: false, controller: controller);
    //@demoflu_end:view
    return view;
  }

  Widget build2() {
    //@demoflu_start:view2
    MultiSplitView view = MultiSplitView(
        resizable: false,
        controller: controller2,
        sizeUnderflowPolicy: SizeUnderflowPolicy.stretchFirst);
    //@demoflu_end:view2
    return view;
  }
}
