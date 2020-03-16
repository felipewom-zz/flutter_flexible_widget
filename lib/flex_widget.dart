import 'package:flutter/widgets.dart';
import 'package:flutter_flexible_widget/flutter_flexible.dart';

// ignore: must_be_immutable
class FlexWidget extends StatelessWidget with FlutterFlexible {
  /// Child for apply the flex Columns
  final Widget child;

  FlexWidget(
      {this.child,
      xs = 12,
      xsOffset = 0,
      xsLand,
      xsLandOffset,
      sm = 6,
      smOffset = 0,
      smLand,
      smLandOffset,
      md = 6,
      mdOffset = 0,
      mdLand,
      mdLandOffset,
      lg = 3,
      lgOffset = 0,
      lgLand,
      lgLandOffset,
      xl = 3,
      xlOffset = 0,
      xlLand,
      xlLandOffset}) {
    columns = Columns(
      xs: xs,
      sm: sm,
      md: md,
      lg: lg,
      xl: xl,
    ).values;
    columnsLand = Columns(
      xs: xsLand ?? xs,
      sm: smLand ?? sm,
      md: mdLand ?? md,
      lg: lgLand ?? lg,
      xl: xlLand ?? xl,
    ).values;
    offsets[FlutterFlexible.xs] = xsOffset;
    offsets[FlutterFlexible.sm] = smOffset;
    offsets[FlutterFlexible.md] = mdOffset;
    offsets[FlutterFlexible.lg] = lgOffset;
    offsets[FlutterFlexible.xl] = xlOffset;
    offsetsLand[FlutterFlexible.xs] = xsLandOffset ?? xsOffset;
    offsetsLand[FlutterFlexible.sm] = smLandOffset ?? smOffset;
    offsetsLand[FlutterFlexible.md] = mdLandOffset ?? mdOffset;
    offsetsLand[FlutterFlexible.lg] = lgLandOffset ?? lgOffset;
    offsetsLand[FlutterFlexible.xl] = xlLandOffset ?? xlOffset;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    final settings = FlexibleWidgetSettings.of(context);
    if (settings == null) {
      throw Exception("The FlexWidget is not into a ResponsiveRow");
    }
    final columnsCount = settings.columnsCount;
    final gridSizeValue = FlutterFlexible.gridSize(size.width);
    if (columns[gridSizeValue] > columnsCount) {
      throw Exception("${gridName[gridSizeValue]} is bigger than columnsCount: ${columns[gridSizeValue]}  > $columnsCount");
    }

    final offset = calcOffset(size, orientation, columnsCount);
    if (offset > 0.0) {
      return Container(
        margin: EdgeInsets.only(left: offset),
        child: SizedBox(
          width: calcWidth(size, orientation, columnsCount),
          child: this.child,
        ),
      );
    } else {
      return SizedBox(
        width: calcWidth(size, orientation, columnsCount),
        child: this.child,
      );
    }
  }
}
