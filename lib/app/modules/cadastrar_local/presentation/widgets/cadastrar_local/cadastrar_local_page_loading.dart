import 'package:flutter/material.dart';

class CadastrarLocalPageLoading extends StatelessWidget {
  const CadastrarLocalPageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
