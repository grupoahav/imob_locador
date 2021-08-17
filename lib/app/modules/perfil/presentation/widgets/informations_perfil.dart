import 'package:flutter/material.dart';
import 'package:imob_design_system/imob_design_system.dart';

class InformationsPerfil extends StatelessWidget {
  const InformationsPerfil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/perfil/pngs/perfil_fake_image.png',
              height: 88.scale,
              width: 88.scale,
            ),
            SizedBox(width: 24.scale),
            const Text(
              'Roberto Queiroz Machado',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 24.scale),
        const Text('+55 (11) 0000-0000'),
        SizedBox(height: 8.scale),
        const Text('Endereço endereço endereço endereço endereço'),
        const Text('São Paulo - SP.'),
      ],
    );
  }
}
