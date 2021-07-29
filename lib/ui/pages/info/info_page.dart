import 'package:flutter/material.dart';
import 'package:imob/ui/pages/info/help_page.dart';
import 'package:imob/ui/pages/info/how_works_page.dart';
import 'package:imob/ui/pages/info/service_terms_page.dart';
import 'package:imob_design_system/imob_design_system.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key? key}) : super(key: key);

  final List<ImobOptionsListItem> items = [
    ImobOptionsListItem("Termos de serviço", pageToOpen: ServiceTermsPage()),
    ImobOptionsListItem("Ajuda", pageToOpen: HelpPage()),
    ImobOptionsListItem("Como funciona", pageToOpen: HowWorksPage()),
    ImobOptionsListItem("Versão 1.0"),
    ImobOptionsListItem("Vídeo")
  ];

  @override
  Widget build(BuildContext context) {
    return ImobPage(
      hasBackButton: true,
      body: ImobOptionsList(
        items: items,
        title: "Informações",
      ),
    );
  }
}
