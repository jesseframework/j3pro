// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:j3enterprise/src/pro/resources/shared/utils/series_number_generator.dart';

//import 'package:j3pro/main.dart';

void main() {
  test('Test randon number in number series', () async {
    NumberGenerator numberGenerator = new NumberGenerator();
    String ng = await numberGenerator.getSerialNumber("Sales Order", 001, 4);
    print(ng);

    expect(ng, ng);
  });
}
