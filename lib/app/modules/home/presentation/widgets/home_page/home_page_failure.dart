import 'package:flutter/material.dart';

class HomePageFailure extends StatelessWidget {
  const HomePageFailure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
