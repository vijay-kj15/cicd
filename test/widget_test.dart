import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:cicd/presentation/screens/user_screen.dart';

void main() {
  // 🔥 Initialize FFI database for tests
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  testWidgets('UserScreen loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: UserScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('User Manager'), findsOneWidget);
  });
}