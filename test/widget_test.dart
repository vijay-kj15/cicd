import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cicd/presentation/screens/user_screen.dart';

void main() {
  testWidgets('UserScreen loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: UserScreen(),
        ),
      ),
    );

    expect(find.text('User Manager'), findsOneWidget);
  });
}