import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view_demo/custom_dashed_divider.dart';
import 'package:multi_split_view_demo/custom_grooved_divider_1.dart';
import 'package:multi_split_view_demo/custom_grooved_divider_2.dart';
import 'package:multi_split_view_demo/dashed_divider.dart';
import 'package:multi_split_view_demo/divider_color.dart';
import 'package:multi_split_view_demo/divider_custom_widget.dart';
import 'package:multi_split_view_demo/divider_highlighted_color.dart';
import 'package:multi_split_view_demo/divider_thickness.dart';
import 'package:multi_split_view_demo/add_remove.dart';
import 'package:multi_split_view_demo/get_started.dart';
import 'package:multi_split_view_demo/grooved_divider_1.dart';
import 'package:multi_split_view_demo/grooved_divider_2.dart';
import 'package:multi_split_view_demo/horizontal.dart';
import 'package:multi_split_view_demo/horizontal_vertical.dart';
import 'package:multi_split_view_demo/listener.dart';
import 'package:multi_split_view_demo/minimal_size.dart';
import 'package:multi_split_view_demo/minimal_weight.dart';
import 'package:multi_split_view_demo/resizable.dart';
import 'package:multi_split_view_demo/setting_weight_stateful.dart';
import 'package:multi_split_view_demo/setting_weight_stateless.dart';
import 'package:multi_split_view_demo/vertical.dart';

void main() {
  Size? maxSize;
  //maxSize = Size(400, 300);
  runApp(DemoFluApp(
      title: 'Multi split view (1.11.0)',
      widgetBackground: Colors.white,
      appMenuBuilder: () {
        return [
          MenuItem(
              name: 'Get started',
              builder: () => GetStartedExample(),
              codeFile: 'lib/get_started.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Horizontal',
              builder: () => HorizontalExample(),
              codeFile: 'lib/horizontal.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Vertical',
              builder: () => VerticalExample(),
              codeFile: 'lib/vertical.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Horizontal and vertical',
              builder: () => HorizontalVerticalExample(),
              codeFile: 'lib/horizontal_vertical.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(name: 'Size', italic: true),
          MenuItem(name: 'Setting the weight', indentation: 2, italic: true),
          MenuItem(
              name: 'Stateless',
              builder: () => SettingWeightStatelessExample(),
              codeFile: 'lib/setting_weight_stateless.dart',
              maxSize: maxSize,
              indentation: 3),
          MenuItem(
              name: 'Stateful',
              builder: () => SettingWeightStatefulExample(),
              codeFile: 'lib/setting_weight_stateful.dart',
              maxSize: maxSize,
              indentation: 3),
          MenuItem(
              name: 'Minimal weight',
              builder: () => MinimalWeightExample(),
              codeFile: 'lib/minimal_weight.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Minimal size',
              builder: () => MinimalSizeExample(),
              codeFile: 'lib/minimal_size.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Resizing disabled',
              builder: () => ResizableExample(),
              codeFile: 'lib/resizable.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Listener',
              builder: () => SizeListenerExample(),
              codeFile: 'lib/listener.dart',
              consoleEnabled: true,
              maxSize: maxSize,
              indentation: 2),
          MenuItem(name: 'Divider', italic: true),
          MenuItem(
              name: 'Thickness',
              builder: () => DividerThicknessExample(),
              codeFile: 'lib/divider_thickness.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Custom widget',
              builder: () => DividerCustomWidgetExample(),
              codeFile: 'lib/divider_custom_widget.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(name: 'Divider painters', italic: true, indentation: 2),
          MenuItem(
              name: 'Background color',
              builder: () => DividerColorExample(),
              codeFile: 'lib/divider_color.dart',
              maxSize: maxSize,
              indentation: 3),
          MenuItem(
              name: 'Highlighted background color',
              builder: () => DividerHighlightedColorExample(),
              codeFile: 'lib/divider_highlighted_color.dart',
              maxSize: maxSize,
              indentation: 3),
          MenuItem(
              name: 'Dashed divider',
              builder: () => DashedDividerExample(),
              codeFile: 'lib/dashed_divider.dart',
              maxSize: maxSize,
              indentation: 3),
          MenuItem(
              name: 'Customizations',
              builder: () => CustomDashedDividerExample(),
              codeFile: 'lib/custom_dashed_divider.dart',
              maxSize: maxSize,
              indentation: 4),
          MenuItem(
              name: 'Grooved divider 1',
              builder: () => GroovedDivider1Example(),
              codeFile: 'lib/grooved_divider_1.dart',
              maxSize: maxSize,
              indentation: 3),
          MenuItem(
              name: 'Customizations',
              builder: () => CustomGroovedDivider1Example(),
              codeFile: 'lib/custom_grooved_divider_1.dart',
              maxSize: maxSize,
              indentation: 4),
          MenuItem(
              name: 'Grooved divider 2',
              builder: () => GroovedDivider2Example(),
              codeFile: 'lib/grooved_divider_2.dart',
              maxSize: maxSize,
              indentation: 3),
          MenuItem(
              name: 'Customizations',
              builder: () => CustomGroovedDivider2Example(),
              codeFile: 'lib/custom_grooved_divider_2.dart',
              maxSize: maxSize,
              indentation: 4),
          MenuItem(name: 'Dynamic', italic: true),
          MenuItem(
              name: 'Add/Remove',
              builder: () => AddRemoveExample(),
              codeFile: 'lib/add_remove.dart',
              maxSize: maxSize,
              indentation: 2)
        ];
      }));
}
