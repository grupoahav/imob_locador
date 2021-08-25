import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'bottom_navigation_controller.g.dart';

class BottomNavigationController = _BottomNavigationControllerBase
    with _$BottomNavigationController;

abstract class _BottomNavigationControllerBase
    with Store
    implements Disposable {
  final PageController pageController = PageController(initialPage: 0);
  @observable
  int currentIndex = 0;

  @action
  void setCurrentIndex(int index) {
    currentIndex = index;
  }

  @action
  void animatedToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    setCurrentIndex(index);
  }

  @override
  void dispose() {
    // Modular.dispose<MeuPerfilController>();
    // Modular.dispose<MeusPedidosController>();

    // Modular.dispose<PedidosStore>();
    // Modular.dispose<PedidosEmAbertoStore>();
    // Modular.dispose<HistoricoPedidosStore>();

    // Modular.dispose<MeusPedidosModule>();
    // Modular.dispose<MeuPerfilModule>();
  }
}
