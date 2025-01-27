import 'package:animated_confirm_dialog/animated_confirm_dialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Dialog Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Dialog Test'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showCustomDialog(
              context: context,
              title: 'Delete Item?',
              message: 'Are you sure you want to delete this item?',
              cancelButtonText: 'No',
              confirmButtonText: 'Yes',
              cancelButtonColor: Colors.red,
              cancelButtonTextColor: Colors.white,
              confirmButtonColor: Colors.green,
              confirmButtonTextColor: Colors.white,
              onCancel: () {
                // Action when cancel button is pressed
                Navigator.of(context).pop();
              },
              onConfirm: () {
                // Action when confirm button is pressed
                Navigator.of(context).pop();
              },
              isFlip: true, // You can set isFlip to true for 3D rotation effect
            );
          },
          child: const Text('Show Custom Dialog'),
        ),
      ),
    );
  }
}
