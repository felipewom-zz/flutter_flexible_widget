import 'package:flutter/material.dart';
import 'package:flutter_flexible_widget/flex_widget.dart';
import 'package:flutter_flexible_widget/flexible_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    // Test code goes here.
    await tester.pumpWidget(FlexibleWidget(
      children: <Widget>[
        FlexWidget(
          xs: 1,
          sm: 1,
          child: Text("Test1"),
        )
      ],
    ));

    final textFinder = find.text('Test1');

    expect(textFinder, findsOneWidget);
  });
}
