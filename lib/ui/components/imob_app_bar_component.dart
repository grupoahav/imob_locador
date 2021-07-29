import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imob/core/viewmodels/global_view_model.dart';
import 'package:imob_design_system/imob_design_system.dart';
import 'package:provider/provider.dart';

class ImobAppBarComponent extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {

    GlobalViewModel viewModel = Provider.of<GlobalViewModel>(context);

    return SafeArea(
      child: Container(
        color: Colors.white,
        height: 70,
        padding: const EdgeInsets.only(top: 8),
        child: ListTile(
          title: _title(viewModel),
          trailing: IconButton(
            iconSize: 32,
            icon: Icon(
              Icons.notifications,
              color: Colors.amber,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.0);

  _title(GlobalViewModel viewModel) {
    switch(viewModel.bottomAppBarSelectedIndex) {
      case 0:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 32,
              icon: Image.asset('assets/images/profile.png', height: 48,),
              onPressed: () {},
            ),
            SizedBox(width: 8),
            Text('Olá, Roberto').toAppBarH6(),
          ],
        );
      case 1:
        return Text("Cadastrar").toAppBarH1();
      case 2:
        return Text('Perfil').toAppBarH1();
      default:
        return Text('Não cadastrado');

    }
  }
}
