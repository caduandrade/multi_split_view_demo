import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:multi_split_view_demo/areas_table.dart';
import 'package:multi_split_view_demo/macros.dart';
import 'package:multi_split_view_demo/measure_view.dart';

class SizeOverflowPage extends DemoFluPage {
  //@demoflu_start:controller
  MultiSplitViewController controller = MultiSplitViewController(areas: [
    Area(size: 200, builder: (context, area) => Draft.blue(), data: 'blue'),
    Area(size: 200, builder: (context, area) => Draft.yellow(), data: 'yellow'),
    Area(
        size: 200,
        min: 100,
        builder: (context, area) => Draft.green(),
        data: 'green')
  ]);
  //@demoflu_end:controller

  final List<Area> _initialAreas = [
    Area(size: 200, builder: (context, area) => Draft.blue(), data: 'blue'),
    Area(size: 200, builder: (context, area) => Draft.yellow(), data: 'yellow'),
    Area(
        size: 200,
        min: 100,
        builder: (context, area) => Draft.green(),
        data: 'green')
  ];

  //@demoflu_start:controller2
  MultiSplitViewController controller2 = MultiSplitViewController(areas: [
    Area(size: 200, builder: (context, area) => Draft.blue(), data: 'blue'),
    Area(size: 200, builder: (context, area) => Draft.yellow(), data: 'yellow'),
    Area(
        size: 200,
        min: 100,
        builder: (context, area) => Draft.green(),
        data: 'green')
  ]);
  //@demoflu_end:controller2

  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();
    sections.text()
      ..add('When the total size of the areas is greater than the available')
      ..add(' space, shrinking is necessary according to the policy.');

    sections.warningBanner(
        text: 'Shrinkage will occur even if the min value is set.');

    sections.code(
        'lib/inconsistency_resolution/size_overflow/size_overflow_page.dart',
        mark: 'controller',
        loadMode: LoadMode.readOnlyMarked,
        title: 'overflow areas');

    sections.widget((context) => AreasTable.fromAreas(_initialAreas));

    sections.code(
        'lib/inconsistency_resolution/size_overflow/size_overflow_page.dart',
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
      ..add('"green" may expand but not shrink as it is already')
      ..add(' below the minimum.');

    sections.heading('Overflow policy');

    sections.text()
      ..add('You can change the resizing policy by')
      ..add(' setting SizeOverflowPolicy.');

    sections.text(text: 'There are the following options:');

    sections.bulletsSection()
      ..create(text: 'shrinkFirst')
      ..create(text: 'shrinkLast (default)');

    sections.code(
        'lib/inconsistency_resolution/size_overflow/size_overflow_page.dart',
        mark: 'controller2',
        loadMode: LoadMode.readOnlyMarked,
        title: 'overflow areas');

    sections.code(
        'lib/inconsistency_resolution/size_overflow/size_overflow_page.dart',
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
        sizeOverflowPolicy: SizeOverflowPolicy.shrinkFirst);
    //@demoflu_end:view2
    return view;
  }
}
