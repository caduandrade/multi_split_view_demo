import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view_demo/divider_color.dart';
import 'package:multi_split_view_demo/divider_painter.dart';
import 'package:multi_split_view_demo/divider_thickness.dart';
import 'package:multi_split_view_demo/add_remove.dart';
import 'package:multi_split_view_demo/horizontal.dart';
import 'package:multi_split_view_demo/horizontal_vertical.dart';
import 'package:multi_split_view_demo/listener.dart';
import 'package:multi_split_view_demo/minimal_size.dart';
import 'package:multi_split_view_demo/minimal_weight.dart';
import 'package:multi_split_view_demo/resizable.dart';
import 'package:multi_split_view_demo/setting_weight.dart';
import 'package:multi_split_view_demo/vertical.dart';

void main() {
  Size? maxSize;
  // maxSize = Size(400, 300);
  runApp(DemoFluApp(
      title: 'Multi split view (1.7.2)',
      widgetBackground: Colors.white,
      appMenuBuilder: (exampleMenuNotifier) {
        return [
          MenuItem(
              name: 'Horizontal',
              example: HorizontalExample(),
              codeFile: 'lib/horizontal.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Vertical',
              example: VerticalExample(),
              codeFile: 'lib/vertical.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Horizontal and vertical',
              example: HorizontalVerticalExample(),
              codeFile: 'lib/horizontal_vertical.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(name: 'Size', italic: true),
          MenuItem(
              name: 'Setting the weight',
              example: SettingWeightExample(),
              codeFile: 'lib/setting_weight.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Minimal weight',
              example: MinimalWeightExample(),
              codeFile: 'lib/minimal_weight.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Minimal size',
              example: MinimalSizeExample(),
              codeFile: 'lib/minimal_size.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Resizing disabled',
              example: ResizableExample(),
              codeFile: 'lib/resizable.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Listener',
              example: SizeListenerExample(),
              codeFile: 'lib/listener.dart',
              consoleEnabled: true,
              maxSize: maxSize,
              indentation: 2),
          MenuItem(name: 'Divider', italic: true),
          MenuItem(
              name: 'Color',
              example: DividerColorExample(),
              codeFile: 'lib/divider_color.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Thickness',
              example: DividerThicknessExample(),
              codeFile: 'lib/divider_thickness.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(
              name: 'Painter',
              example: DividerPainterExample(),
              codeFile: 'lib/divider_painter.dart',
              maxSize: maxSize,
              indentation: 2),
          MenuItem(name: 'Dynamic', italic: true),
          MenuItem(
              name: 'Add/Remove',
              example: AddRemoveExample(exampleMenuNotifier),
              codeFile: 'lib/add_remove.dart',
              maxSize: maxSize,
              indentation: 2)
        ];
      }));
}
