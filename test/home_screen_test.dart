import 'package:allisto_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Home screen is displayed correctly", () {
    testWidgets('Home screen has text Allisto', (tester) async {
      await tester.pumpWidget(new MaterialApp(home: HomePage(),));
      expect(find.text('Allisto'), findsOneWidget);
    });
    testWidgets('Home screen has mic button', (tester) async {
      await tester.pumpWidget(new MaterialApp(home: HomePage(),));
      expect(find.widgetWithIcon(FloatingActionButton, Icons.mic_none),
          findsOneWidget);
    });
    testWidgets('Home screen has dashboard button', (tester) async {
      await tester.pumpWidget(new MaterialApp(home: HomePage(),));
      expect(find.widgetWithIcon(IconButton, Icons.dashboard), findsOneWidget);
    });
    testWidgets('Home screen has contact button', (tester) async {
      await tester.pumpWidget(new MaterialApp(home: HomePage(),));
      expect(find.widgetWithIcon(IconButton, Icons.perm_contact_calendar),
          findsOneWidget);
    });
  });
}
