// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ranuser/presentation/coreui/loading_indicator.dart';
import 'package:ranuser/presentation/coreui/no_data_found.dart';
import 'package:ranuser/presentation/home/pages/home_page.dart';

void main() {
  testWidgets('renders correct text to no data found', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: NoDataFound('Users not found'),
        ),
      ),
    );
    expect(find.text('Users not found'), findsOneWidget);
  });

  testWidgets('renders correct widget to loading', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoadingIndicator(typeIndicator: CircularProgressType()),
        ),
      ),
    );
    expect(find.byType(LoadingIndicator), findsOneWidget);
  });

  testWidgets('renders HomePage', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HomePage(
            title: 'Random users',
          ),
        ),
      ),
    );
    expect(find.byType(HomePage), findsOneWidget);
  });
}
