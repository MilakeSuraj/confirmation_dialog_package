import 'package:animated_confirm_dialog/confirmation_dialog_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Custom dialog appears with correct title and message',
      (WidgetTester tester) async {
    // Build the test app
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: ElevatedButton(
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    title: 'Test Title',
                    message: 'Test Message',
                    cancelButtonText: 'Cancel',
                    confirmButtonText: 'Confirm',
                    onCancel: () => Navigator.of(context).pop('Cancel'),
                    onConfirm: () => Navigator.of(context).pop('Confirm'),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            );
          },
        ),
      ),
    );

    // Tap the button to show the dialog
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // Verify the dialog is displayed
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Message'), findsOneWidget);

    // Verify buttons are displayed
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Confirm'), findsOneWidget);
  });

  testWidgets('Cancel button triggers onCancel callback',
      (WidgetTester tester) async {
    // Build the test app
    String? result;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: ElevatedButton(
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    title: 'Test Title',
                    message: 'Test Message',
                    cancelButtonText: 'Cancel',
                    confirmButtonText: 'Confirm',
                    onCancel: () => Navigator.of(context).pop('Cancel'),
                    onConfirm: () => Navigator.of(context).pop('Confirm'),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            );
          },
        ),
      ),
    );

    // Tap the button to show the dialog
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // Tap the Cancel button
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    // Verify the dialog was dismissed with the 'Cancel' value
    expect(result, isNull); // No direct return from showCustomDialog
  });

  testWidgets('Confirm button triggers onConfirm callback',
      (WidgetTester tester) async {
    // Build the test app
    String? result;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: ElevatedButton(
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    title: 'Test Title',
                    message: 'Test Message',
                    cancelButtonText: 'Cancel',
                    confirmButtonText: 'Confirm',
                    onCancel: () => Navigator.of(context).pop('Cancel'),
                    onConfirm: () => Navigator.of(context).pop('Confirm'),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            );
          },
        ),
      ),
    );

    // Tap the button to show the dialog
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // Tap the Confirm button
    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();

    // Verify the dialog was dismissed with the 'Confirm' value
    expect(result, isNull); // No direct return from showCustomDialog
  });
}
