import 'package:example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Custom dialog shows and functions correctly',
      (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const MyApp());

    // Verify the button exists on the main screen
    expect(find.text('Show Custom Dialog'), findsOneWidget);

    // Tap the button to show the dialog
    await tester.tap(find.text('Show Custom Dialog'));
    await tester.pumpAndSettle();

    // Verify the dialog appears with the correct title and message
    expect(find.text('Delete Item?'), findsOneWidget);
    expect(find.text('Are you sure you want to delete this item?'),
        findsOneWidget);

    // Verify the dialog buttons exist
    expect(find.text('No'), findsOneWidget);
    expect(find.text('Yes'), findsOneWidget);

    // Tap the "No" button and verify the dialog disappears
    await tester.tap(find.text('No'));
    await tester.pumpAndSettle();
    expect(find.text('Delete Item?'), findsNothing);

    // Tap the button to show the dialog again
    await tester.tap(find.text('Show Custom Dialog'));
    await tester.pumpAndSettle();

    // Tap the "Yes" button and verify the dialog disappears
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle();
    expect(find.text('Delete Item?'), findsNothing);
  });
}
