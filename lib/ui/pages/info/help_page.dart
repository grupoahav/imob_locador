import 'package:flutter/material.dart';
import 'package:imob/ui/pages/info/help/questions_page.dart';
import 'package:imob/ui/pages/info/help/send_question_page.dart';
import 'package:imob_design_system/imob_design_system.dart';

class HelpPage extends StatelessWidget {
  HelpPage({Key? key}) : super(key: key);

  final List<ImobOptionsListItem> items = [
    ImobOptionsListItem("Dúvidas frequentes", pageToOpen: QuestionsPage()),
    ImobOptionsListItem("Enviar pergunta", pageToOpen: SendQuestionPage()),
    ImobOptionsListItem("Fale com a gente"),
  ];

  @override
  Widget build(BuildContext context) {
    return ImobPage(
      hasBackButton: true,
      body: ImobOptionsList(
        items: items,
        title: "Ajuda",
        titleColor: Colors.red,
      ),
    );
  }
}
