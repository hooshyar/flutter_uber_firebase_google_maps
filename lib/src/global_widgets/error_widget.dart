import 'package:flutter/material.dart';

class GlobalErrorWidget extends StatelessWidget {
  const GlobalErrorWidget({Key? key, this.theError}) : super(key: key);
  final String? theError;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: Center(
            child: Text(theError ?? 'Global Error'),
          ),
        ),
      ),
    );
  }
}
