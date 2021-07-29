import 'package:flutter/material.dart';
import 'package:imob/core/viewmodels/global_view_model.dart';
import 'package:provider/provider.dart';

class ImobBottomAppBarComponent extends StatelessWidget {
  const ImobBottomAppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    GlobalViewModel viewModel = Provider.of<GlobalViewModel>(context);

    return BottomNavigationBar(
      backgroundColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box),
          label: 'Cadastrar novo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
      currentIndex: viewModel.bottomAppBarSelectedIndex,
      selectedItemColor: Colors.teal,
      onTap: viewModel.onBottomAppBarItemTapped,
    );
  }
}
