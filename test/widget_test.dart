import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_app/app.dart';
import 'package:go_app/injection_container.dart' as di;

void main() {
  setUp(() async {
    await di.init();
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  testWidgets('Home Page shows loading then welcome message', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pump(); // Allow BLoC to process event and emit Loading

    // Verify loading indicator is shown initially
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for the delay in the DataSource (2 seconds)
    await tester.pump(const Duration(seconds: 2));

    // Wait for animations/microtasks
    await tester.pumpAndSettle();

    // Verify that the welcome message is displayed
    expect(find.text('Welcome to Clean Architecture with BLoC!'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle_outline), findsOneWidget);
  });
}
