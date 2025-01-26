import 'package:confirmation_dialog_package/confirmation_dialog_package.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Dialog Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Dialog Test'),
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
                print('Cancel pressed');
              },
              onConfirm: () {
                // Action when confirm button is pressed
                Navigator.of(context).pop();
                print('Confirm pressed');
              },
              isFlip: true, // You can set isFlip to true for 3D rotation effect
            );
          },
          child: Text('Show Custom Dialog'),
        ),
      ),
    );
  }
}
