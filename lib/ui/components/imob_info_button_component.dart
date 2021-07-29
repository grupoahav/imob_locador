import 'package:flutter/material.dart';
import 'package:imob/ui/pages/info/info_page.dart';
import 'package:imob_design_system/imob_design_system.dart';

class ImobInfoButtonComponent extends StatelessWidget {
  const ImobInfoButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => InfoPage())),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.info_outline,
                color: ImobColors.iconColor,
              ),
              SizedBox(width: 8),
              Text(
                "Informações sobre o APP",
                style: TextStyle(
                  color: ImobColors.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
