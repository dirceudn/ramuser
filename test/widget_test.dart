import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ranuser/presentation/coreui/loading_indicator.dart';
import 'package:ranuser/presentation/coreui/no_data_found.dart';
import 'package:ranuser/presentation/coreui/user_item.dart';

void main() {
    setUpAll(() => HttpOverrides.global = null);

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

    testWidgets('render user item', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UserItem("12345", "Jonh","http://lorempixel.com/640/480/cat", "(712) 594-1722"),
        ),
      ),
    );
    expect(find.text('Jonh'), findsOneWidget);
    expect(find.text('(712) 594-1722'), findsOneWidget);
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
}
