import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view_demo/antialiasing_workaround/antialiasing_workaround.dart';
import 'package:multi_split_view_demo/area_flex/area_flex_page.dart';
import 'package:multi_split_view_demo/area_size/area_size_page.dart';
import 'package:multi_split_view_demo/area_widget/area_widget_page.dart';
import 'package:multi_split_view_demo/axis/axis_page.dart';
import 'package:multi_split_view_demo/changing_programmatically/changing_programmatically_page.dart';
import 'package:multi_split_view_demo/divider/customization/customization.dart';
import 'package:multi_split_view_demo/divider/listener/listener_page.dart';
import 'package:multi_split_view_demo/divider/push_mode/push_mode_page.dart';
import 'package:multi_split_view_demo/divider/tap_gestures/tap_gestures_page.dart';
import 'package:multi_split_view_demo/get_started/get_started_page.dart';
import 'package:multi_split_view_demo/inconsistency_resolution/size_overflow/size_overflow_page.dart';
import 'package:multi_split_view_demo/inconsistency_resolution/size_underflow/size_underflow_page.dart';
import 'package:multi_split_view_demo/inconsistency_resolution/zero_flex/zero_flex_page.dart';
import 'package:multi_split_view_demo/macros.dart';
import 'package:multi_split_view_demo/resizable/resizable_page.dart';

void main() {
  DemoFluApp app =
      DemoFluApp(title: 'Multi split view (3.2.0)', rootMenus: _rootMenus);
  app.macro.widget(Macros.styleExample, (context, section) {
    section
      ..padding = const EdgeInsets.all(10)
      ..background = Colors.grey[100]
      ..solidBorder(color: Colors.grey[200]);
  });
  app.macro.widget(Macros.horizontalExample, (context, section) {
    section
      ..maxHeight = 100
      ..maxWidth = 500
      ..runMacro(id: Macros.styleExample, context: context);
  });
  app.macro.group(Macros.tryOut, (context, section) {
    section
      ..padding = const EdgeInsets.fromLTRB(16, 4, 16, 4)
      ..text(text: 'Try out here').marginLeft = 8
      ..bulletBorder(
          color: Colors.grey[600]!,
          iconColor: Colors.white,
          icon: Icons.gesture,
          thickness: 6,
          diameter: 32);
  });
  app.macro.text(Macros.textAfter, (context, section) {
    section
      ..padding = const EdgeInsets.all(16)
      ..marginLeft = 32
      ..arrowDownBorder(color: Colors.grey[600]);
  });
  app.run();
}

List<DemoMenuItem> get _rootMenus => [
      DemoMenuItem('Get started', page: () => GetStartedPage()),
      DemoMenuItem('Area widget', page: () => AreaWidgetPage()),
      DemoMenuItem('Area flex', page: () => AreaFlexPage()),
      DemoMenuItem('Area size', page: () => AreaSizePage()),
      DemoMenuItem('Changing programmatically',
          page: () => ChangingProgrammaticallyPage()),
      DemoMenuItem('Inconsistency resolution', children: [
        DemoMenuItem('Zero flex', page: () => ZeroFlexPage()),
        DemoMenuItem('Size overflow', page: () => SizeOverflowPage()),
        DemoMenuItem('Size underflow', page: () => SizeUnderflowPage())
      ]),
      DemoMenuItem('Axis', page: () => AxisPage()),
      DemoMenuItem('Resizable', page: () => ResizablePage()),
      DemoMenuItem('Divider', children: [
        DemoMenuItem('Listener', page: () => ListenerPageExample()),
        DemoMenuItem('Tap gestures', page: () => DividerTapGesturesPage()),
        DemoMenuItem('Customization', page: () => CustomizationPage()),
        DemoMenuItem('Push mode', page: () => PushModePage())
      ]),
      DemoMenuItem('Antialiasing troubleshooting workaround',
          page: () => AntialiasingWorkaroundPage())
    ];
