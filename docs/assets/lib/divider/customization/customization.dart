import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view_demo/divider/customization/color_example.dart';
import 'package:multi_split_view_demo/divider/customization/custom_dashed_example.dart';
import 'package:multi_split_view_demo/divider/customization/custom_grooved1_example.dart';
import 'package:multi_split_view_demo/divider/customization/custom_grooved2_example.dart';
import 'package:multi_split_view_demo/divider/customization/custom_widget_example.dart';
import 'package:multi_split_view_demo/divider/customization/dashed_example.dart';
import 'package:multi_split_view_demo/divider/customization/grooved1_example.dart';
import 'package:multi_split_view_demo/divider/customization/grooved2_example.dart';
import 'package:multi_split_view_demo/divider/customization/highlighted_color_example.dart';
import 'package:multi_split_view_demo/divider/customization/painter_from_scratch_example.dart';
import 'package:multi_split_view_demo/divider/customization/thickness_example.dart';
import 'package:multi_split_view_demo/macros.dart';

class CustomizationPage extends DemoFluPage {
  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();
    sections.heading('Thickness');
    sections
        .widget((context) => const ThicknessExample())
        .runMacro(id: Macros.horizontalExample, context: context);
    sections.code('lib/divider/customization/thickness_example.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    sections.heading('Color');
    sections
        .widget((context) => const ColorExample())
        .runMacro(id: Macros.horizontalExample, context: context);
    sections.code('lib/divider/customization/color_example.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    sections.heading('Custom widget');
    sections
        .widget((context) => const CustomWidgetExample())
        .runMacro(id: Macros.horizontalExample, context: context);
    sections.code('lib/divider/customization/custom_widget_example.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    sections.heading('Highlighted color');
    sections
        .widget((context) => const HighlightedColorExample())
        .runMacro(id: Macros.horizontalExample, context: context);
    sections.code('lib/divider/customization/highlighted_color_example.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    sections.heading('Dashed');
    sections
        .widget((context) => const DashedExample())
        .runMacro(id: Macros.horizontalExample, context: context);
    sections.code('lib/divider/customization/dashed_example.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    sections.heading('Custom dashed');
    sections
        .widget((context) => const CustomDashedExample())
        .runMacro(id: Macros.horizontalExample, context: context);
    sections.code('lib/divider/customization/custom_dashed_example.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    sections.heading('Grooved 1');
    sections
        .widget((context) => const Grooved1Example())
        .runMacro(id: Macros.horizontalExample, context: context);
    sections.code('lib/divider/customization/grooved1_example.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    sections.heading('Custom grooved 1');
    sections
        .widget((context) => const CustomGrooved1Example())
        .runMacro(id: Macros.horizontalExample, context: context);
    sections.code('lib/divider/customization/custom_grooved1_example.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    sections.heading('Grooved 2');
    sections
        .widget((context) => const Grooved2Example())
        .runMacro(id: Macros.horizontalExample, context: context);
    sections.code('lib/divider/customization/grooved2_example.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    sections.heading('Custom grooved 2');
    sections
        .widget((context) => const CustomGrooved2Example())
        .runMacro(id: Macros.horizontalExample, context: context);
    sections.code('lib/divider/customization/custom_grooved2_example.dart',
        mark: 'show', loadMode: LoadMode.readOnlyMarked);

    sections.heading('Painter from scratch');
    sections
        .widget((context) => const PainterFromScratchExample())
        .runMacro(id: Macros.horizontalExample, context: context);
    sections
        .code('lib/divider/customization/painter_from_scratch_example.dart');

    return sections;
  }
}
