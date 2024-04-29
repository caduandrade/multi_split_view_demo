import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view_demo/axis/combine_example.dart';
import 'package:multi_split_view_demo/axis/horizontal_example.dart';
import 'package:multi_split_view_demo/axis/vertical_example.dart';
import 'package:multi_split_view_demo/macros.dart';

class AxisPage extends DemoFluPage {
  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();

    sections.text()
      ..add('You can split the Widget horizontally or vertically,')
      ..add(' creating distinct areas.');

    sections.heading('Horizontal');

    sections.text(text: 'This is the default axis.');

    sections
        .widget((context) => const HorizontalExample())
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.code('lib/axis/horizontal_example.dart');

    sections.heading('Vertical');

    sections
        .widget((context) => const VerticalExample(),
            maxHeight: 250, maxWidth: 200)
        .runMacro(id: Macros.styleExample, context: context);
    sections.code('lib/axis/vertical_example.dart');

    sections.heading('Combining both');

    sections.widget((context) => const CombineExample())
      ..runMacro(id: Macros.horizontalExample, context: context)
      ..maxHeight = 250;

    sections.code('lib/axis/combine_example.dart');

    return sections;
  }
}
