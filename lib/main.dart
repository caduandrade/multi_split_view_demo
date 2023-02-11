import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view_demo/examples/add_remove.dart';
import 'package:multi_split_view_demo/examples/custom_dashed_divider.dart';
import 'package:multi_split_view_demo/examples/custom_grooved_divider_1.dart';
import 'package:multi_split_view_demo/examples/custom_grooved_divider_2.dart';
import 'package:multi_split_view_demo/examples/dashed_divider.dart';
import 'package:multi_split_view_demo/examples/divider_color.dart';
import 'package:multi_split_view_demo/examples/divider_custom_widget.dart';
import 'package:multi_split_view_demo/examples/divider_highlighted_color.dart';
import 'package:multi_split_view_demo/examples/divider_tap_gestures.dart';
import 'package:multi_split_view_demo/examples/divider_thickness.dart';
import 'package:multi_split_view_demo/examples/get_started.dart';
import 'package:multi_split_view_demo/examples/grooved_divider_1.dart';
import 'package:multi_split_view_demo/examples/grooved_divider_2.dart';
import 'package:multi_split_view_demo/examples/horizontal.dart';
import 'package:multi_split_view_demo/examples/horizontal_vertical.dart';
import 'package:multi_split_view_demo/examples/listener.dart';
import 'package:multi_split_view_demo/examples/minimal_sizes.dart';
import 'package:multi_split_view_demo/examples/minimal_weights.dart';
import 'package:multi_split_view_demo/examples/programmatically.dart';
import 'package:multi_split_view_demo/examples/resizable.dart';
import 'package:multi_split_view_demo/examples/setting_weight_stateful.dart';
import 'package:multi_split_view_demo/examples/setting_weight_stateless.dart';
import 'package:multi_split_view_demo/examples/vertical.dart';

void main() {
  runApp(DemoFluApp(
      // maxSize: Size(400, 300),
      title: 'Multi split view (2.3.0)',
      exampleBackground: Colors.white,
      rootMenus: _rootMenus));
}

List<DemoMenuItem> get _rootMenus => [
      _getStarted,
      _horizontal,
      _vertical,
      _horizontalAndVertical,
      _sizeAndWeight,
      _dividerSections,
      _dynamicSection,
      _changingWeightsSizesProgrammatically
    ];

DemoMenuItem get _getStarted =>
    DemoMenuItem('Get started', example: GetStartedExample());

DemoMenuItem get _horizontal =>
    DemoMenuItem('Horizontal', example: HorizontalExample());

DemoMenuItem get _vertical =>
    DemoMenuItem('Vertical', example: VerticalExample());

DemoMenuItem get _horizontalAndVertical =>
    DemoMenuItem('Horizontal and vertical',
        example: HorizontalVerticalExample());

DemoMenuItem get _sizeAndWeight => DemoMenuItem('Size and weight', children: [
      _settingTheWeight,
      _minimalWeights,
      _minimalSizes,
      _resizingDisabled,
      _listener
    ]);

DemoMenuItem get _settingTheWeight =>
    DemoMenuItem('Setting the weight', children: [_stateless, _stateful]);

DemoMenuItem get _stateless =>
    DemoMenuItem('Stateless', example: SettingWeightStatelessExample());

DemoMenuItem get _stateful =>
    DemoMenuItem('Stateful', example: SettingWeightStatefulExample());

DemoMenuItem get _minimalWeights =>
    DemoMenuItem('Minimal weights', example: MinimalWeightsExample());

DemoMenuItem get _minimalSizes =>
    DemoMenuItem('Minimal sizes', example: MinimalSizesExample());

DemoMenuItem get _resizingDisabled =>
    DemoMenuItem('Resizing disabled', example: ResizableExample());

DemoMenuItem get _listener =>
    DemoMenuItem('Listener', example: SizeListenerExample());

DemoMenuItem get _dividerSections => DemoMenuItem('Divider', children: [
      _thickness,
      _customWidget,
      _tapGestures,
      _dividerPaintersSection
    ]);

DemoMenuItem get _thickness =>
    DemoMenuItem('Thickness', example: DividerThicknessExample());

DemoMenuItem get _customWidget =>
    DemoMenuItem('Custom widget', example: DividerCustomWidgetExample());

DemoMenuItem get _tapGestures =>
    DemoMenuItem('Tap gestures', example: DividerTapGesturesExample());

DemoMenuItem get _dividerPaintersSection =>
    DemoMenuItem('Divider painters', children: [
      _backgroundColor,
      _highlightedBackground,
      _dashedDivider,
      _groovedDivider1,
      _groovedDivider2
    ]);

DemoMenuItem get _backgroundColor =>
    DemoMenuItem('Background color', example: DividerColorExample());

DemoMenuItem get _highlightedBackground =>
    DemoMenuItem('Highlighted background color',
        example: DividerHighlightedColorExample());

DemoMenuItem get _dashedDivider => DemoMenuItem('Dashed divider',
    example: DashedDividerExample(), children: [_customDashedDivider]);

DemoMenuItem get _customDashedDivider =>
    DemoMenuItem('Customizations', example: CustomDashedDividerExample());

DemoMenuItem get _groovedDivider1 => DemoMenuItem('Grooved divider 1',
    example: GroovedDivider1Example(), children: [_customGroovedDivider1]);

DemoMenuItem get _customGroovedDivider1 =>
    DemoMenuItem('Customizations', example: CustomGroovedDivider1Example());

DemoMenuItem get _groovedDivider2 => DemoMenuItem('Grooved divider 2',
    example: GroovedDivider2Example(), children: [_customGroovedDivider2]);

DemoMenuItem get _customGroovedDivider2 =>
    DemoMenuItem('Customizations', example: CustomGroovedDivider2Example());

DemoMenuItem get _dynamicSection =>
    DemoMenuItem('Dynamic', children: [_dynamicAddRemove]);

DemoMenuItem get _dynamicAddRemove =>
    DemoMenuItem('Add/Remove', example: AddRemoveExample());

DemoMenuItem get _changingWeightsSizesProgrammatically =>
    DemoMenuItem('Changing the weights or sizes programmatically',
        example: ProgrammaticallyExample());
