import 'package:flutter/material.dart';

class GlobalLoadingWidget extends StatelessWidget {
  const GlobalLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
