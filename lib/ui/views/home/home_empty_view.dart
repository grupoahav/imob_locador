import 'package:flutter/material.dart';
import 'package:imob_design_system/imob_design_system.dart';

class HomeEmptyView extends StatelessWidget {
  const HomeEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _topView(),
        _middleView(),
        _bottomView(),
      ],
    );
  }

  _topView() {
    return Column(
      children: [
        Image.asset('assets/images/home.png'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Aqui você cadastra e encontra todos seus locais cadastrados.',
            style: TextStyle(
              color: ImobColors.textColor,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          'Lembre-se, quanto mais cadastros completos mais chances do seu local ser escolhido.',
          style: TextStyle(
            color: ImobColors.textColor,
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  _middleView() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Image.asset('assets/images/empty.png'),
      ),
    );
  }

  _bottomView() {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
                fontSize: 13.0,
                color: ImobColors.textColor,
                fontWeight: FontWeight.w300),
            children: <TextSpan>[
              TextSpan(
                  text:
                  'Ops! Parece que você ainda não tem nenhum cadastro. Clique em '),
              TextSpan(
                text: 'Cadastrar Novo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' para começar.'),
            ],
          ),
        ),
        Image.asset(
          'assets/images/bottom_arrow.png',
          height: 100,
        ),
      ],
    );
  }
}
