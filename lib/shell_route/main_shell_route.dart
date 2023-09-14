import 'package:flutter/material.dart';

class MainShellRoute extends StatelessWidget {
  const MainShellRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
