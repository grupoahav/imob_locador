import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imob_design_system/imob_design_system.dart';

class CadastrarLocalPageEmpty extends StatelessWidget {
  const CadastrarLocalPageEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          minHeight:
              ScreenUtil.pageViewHeight(context) - ScreenUtil.toolBarHeight * 2,
        ),
        child: Column(
          // padding: EdgeInsets.all(24.0.scale),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...[
              SvgPicture.asset(
                ImobSvgs.icon_imob_telecom,
                package: ImobSvgs.package,
                height: 72.scale,
              ),
              SizedBox(height: 24.scale),
              Text(
                'Aqui você cadastra e encontra todos seus locais cadastrados.',
                style: theme.textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.scale),
              const Text(
                'Lembre-se, quanto mais cadastros completos mais chances do seu local ser escolhido.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.scale),
              Image.asset(
                'assets/home/pngs/home_empty.png',
                height: 216.scale,
              ),
              SizedBox(height: 16.scale),
              const Text(
                'Ops! Parece que você ainda não tem nenhum cadastro. Clique em Cadastrar Novo para começar.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.scale),
            ],
            SvgPicture.asset(
              'assets/home/svgs/bottom_arrow.svg',
              height: 72.scale,
            ),
          ],
        ),
      ),
    );
  }
}
