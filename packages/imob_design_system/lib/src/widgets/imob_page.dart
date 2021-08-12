import 'package:flutter/material.dart';

class ImobPage extends StatelessWidget {
  const ImobPage({Key? key, required this.body, this.hasBackButton = false})
      : super(key: key);

  final Widget body;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasBackButton) _appBarBackButton(context),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: body,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appBarBackButton(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.arrow_back_outlined,
                // color: ImobColors.darkGray,
              ),
              SizedBox(width: 8),
              // Text(
              //   "Voltar",
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: ImobColors.textColor,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
