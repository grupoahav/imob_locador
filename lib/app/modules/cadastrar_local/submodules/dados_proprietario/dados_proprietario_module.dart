import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/confirmacao_page.dart';
import 'presentation/pages/contatos_page.dart';
import 'presentation/pages/dados_pessoais_page.dart';
import 'presentation/pages/enderecos_page.dart';

class DadosProprietarioModule extends Module {
  static String get routeName => '/dadosProprietario';
  static String get routeInitial => routeName;

  static String get routeToDadosPessoais => './dadosPessoais';
  static String get routeToEnderecos => './enderecos';
  static String get routeToContatos => './contatos';
  static String get routeToConfirmacao => './confirmacao';

  @override
  final List<Bind> binds = [
    // ------------------------ STORES ------------------------
    // --------------------- CONTROLLERS ----------------------
    // ---------------------- USE CASES -----------------------
    // --------------------- REPOSITORIES ---------------------
    // --------------------- DATA SOURCES ---------------------
    // ------------------------ OTHERS ------------------------
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/dadosPessoais',
      child: (_, args) => DadosPessoaisPage(),
    ),
    ChildRoute(
      '/enderecos',
      child: (_, args) => EnderecosPage(),
    ),
    ChildRoute(
      '/contatos',
      child: (_, args) => ContatosPage(),
    ),
    ChildRoute(
      '/confirmacao',
      child: (_, args) => ConfirmacaoPage(),
    ),
  ];
}
