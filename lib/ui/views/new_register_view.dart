import 'package:flutter/material.dart';
import 'package:imob_design_system/colors/colors.dart';

class NewRegisterView extends StatelessWidget {
  const NewRegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Nome do Local",
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: ImobColors.titleColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Image.asset("assets/images/capa.png"),
            ),
            _inputText(
              icon: Icons.location_on,
              label: "Endereço",
              hint: "Endereço completo",
            ),
            _inputText(icon: Icons.bar_chart, label: "IPTU", hint: "hint IPTU"),
            _inputText(icon: Icons.bar_chart, label: "Doc", hint: "hint Doc"),
            _inputText(icon: Icons.bar_chart, label: "Doc", hint: "hint Doc"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: MaterialButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Text("Cancelar"),
                          ))),
                  SizedBox(width: 16),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      color: ImobColors.titleColor,
                      textColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text("Salvar"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _inputText({
    required IconData icon,
    required String label,
    required String hint,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: ImobColors.titleColor,
                ),
                SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                  size: 32,
                )
              ],
            ),
            Text("+50 pontos"),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  hintText: hint,
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.check,
              color: Colors.greenAccent,
            ),
          ],
        ),
      ],
    );
  }
}
