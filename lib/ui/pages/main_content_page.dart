import 'package:flutter/material.dart';
import 'package:imob/core/viewmodels/global_view_model.dart';
import 'package:imob/ui/components/imob_app_bar_component.dart';
import 'package:imob/ui/components/imob_bottom_app_bar_component.dart';
import 'package:imob/ui/views/home/home_view.dart';
import 'package:imob/ui/views/new_register_view.dart';
import 'package:imob/ui/views/profile_view.dart';
import 'package:provider/provider.dart';

class MainContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalViewModel viewModel = Provider.of<GlobalViewModel>(context);

    return Scaffold(
      appBar: ImobAppBarComponent(),
      body: _body(viewModel),
      bottomNavigationBar: ImobBottomAppBarComponent(),
    );
  }

  _body(GlobalViewModel viewModel) {
    switch (viewModel.bottomAppBarSelectedIndex) {
      case 0:
        return HomeView();
      case 1:
        return NewRegisterView();
      case 2:
        return ProfileView();
      default:
        return Center(child: Text('Tabbar não cadastrada'));
    }
  }
}
