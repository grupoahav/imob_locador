import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../cadastrar_local/cadastrar_local_module.dart';
import '../controllers/bottom_navigation_controller.dart';

class ImobBottomNavigationBar extends StatelessWidget {
  const ImobBottomNavigationBar({Key? key, required this.controller})
      : super(key: key);

  final BottomNavigationController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BottomNavigationBar(
        onTap: (index) {
          if (index == 1) {
            Modular.to.pushNamed(CadastrarLocalModule.routeInitial);
            controller.animatedToPage(index);
          } else {
            controller.animatedToPage(index);
          }
        },
        currentIndex: controller.currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Cadastrar novo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Perfil',
          ),
        ],
      );
    });
  }
}
