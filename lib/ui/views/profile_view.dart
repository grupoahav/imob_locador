import 'package:flutter/material.dart';
import 'package:imob_design_system/colors/colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/images/profile.png'),
                SizedBox(width: 24),
                Text(
                  'Roberto Queiroz Machado',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                '+55 (11) 0000-0000',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: ImobColors.textColor),
              ),
            ),
            Text(
              'Endereço endereço endereço endereço endereço',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ImobColors.textColor),
            ),
            Text(
              'São Paulo - SP.',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ImobColors.textColor),
            ),
            Expanded(child: Container()),
            Row(
              children: [
                Icon(Icons.lock, color: ImobColors.iconColor,),
                SizedBox(width: 8),
                Text(
                  'Políticas de Privacidade',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ImobColors.textColor),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.info_outline, color: ImobColors.iconColor,),
                SizedBox(width: 8),
                Text(
                  'Informações sobre o APP',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: ImobColors.textColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
