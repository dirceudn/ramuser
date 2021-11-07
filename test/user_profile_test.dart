import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ranuser/core/home/api/model/users_reponse.dart';
import 'package:ranuser/presentation/user/views/user_profile_view.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);

  testWidgets('profile test', (WidgetTester tester) async {
    /// Now we can pump NetworkImages without crashing our tests. Yay!
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UserProfile(
            name: "Jonh",
            photo: "http://lorempixel.com/640/480/cats",
            email: "jonh@gmail.com",
            contact: Contact("980 Kozey Plain", "New Vella", "Ecuador",
                "jonh@gmail.com", "(712) 594-1722"),
          ),
        ),
      ),
    );
    expect(find.text("Jonh"), findsWidgets);
    expect(find.text("jonh@gmail.com"), findsWidgets);
    expect(find.text("980 Kozey Plain"), findsWidgets);
    expect(find.text("(712) 594-1722"), findsWidgets);
  });
}
