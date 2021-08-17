import 'package:flutter/material.dart';
import 'package:imob_design_system/imob_design_system.dart';

import '../widgets/footer_perfil.dart';
import '../widgets/informations_perfil.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Perfil'),
          actions: [
            IconButton(
              iconSize: 32,
              icon: const Icon(
                Icons.notifications,
                color: Colors.amber,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24.scale),
          child: Container(
            constraints: BoxConstraints(
              minHeight: ScreenUtil.pageViewHeight(context) -
                  ScreenUtil.bottomBarHeight * 2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                InformationsPerfil(),
                FooterPerfil(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
