import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view_demo/get_started/stateful_example.dart';
import 'package:multi_split_view_demo/get_started/stateless_example.dart';
import 'package:multi_split_view_demo/macros.dart';

class GetStartedPage extends DemoFluPage {
  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();

    sections.heading('Stateful');

    sections.code('lib/get_started/stateful_example.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    sections
        .widget((context) => const MyStatefulWidget())
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.heading('Stateless');

    sections.code('lib/get_started/stateless_example.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    sections
        .widget((context) => const MyStatelessWidget())
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.divider();

    sections.tipBanner(text: 'The divider does not have a default color.');

    return sections;
  }
}
