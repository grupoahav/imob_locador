import 'package:flutter/material.dart';
import 'package:imob_design_system/imob_design_system.dart';

class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int _expanded = -1;

  _divider() {
    return Container(
      child: Divider(
        color: Colors.black,
      ),
    );
  }

  _questionItem({index, title, text}) {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ImobColors.textColor),
            ),
            trailing: Icon(
                (index != _expanded)
                    ? Icons.arrow_drop_down
                    : Icons.arrow_drop_up,
                size: 30),
            onTap: () {
              setState(() {
                _expanded = (index != _expanded) ? index : -1;
              });
            },
          ),
          if (_expanded == index)
            Container(
              child: Text(
                text,
                style: TextStyle(color: ImobColors.textColor),
              ),
            ),
        ],
      ),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                "Dúvidas frequentes",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF04B4D),
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          _divider(),
          _questionItem(
              index: 1,
              title: "Como cadastro meu imóvel?",
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus."),
          _divider(),
          _questionItem(
              index: 2,
              title: "Como melhorar meu cadastro?",
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus."),
          _divider(),
          _questionItem(
              index: 3,
              title: "Quando posso ser escolhido?",
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis lorem in tellus auctor auctor. Aenean vitae diam maximus, volutpat eros quis, feugiat ex. Quisque ipsum turpis, tincidunt eu rutrum sed, iaculis ac enim. Maecenas pretium auctor pretium. Quisque ac nibh a erat sodales pretium a mollis magna. Nulla et lacinia leo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vestibulum et aliquam tellus. Nam lacinia lorem ut tortor tristique lobortis. Suspendisse at egestas diam, eu venenatis ante. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer imperdiet congue eros, a ornare metus blandit eget. Nulla facilisi. Interdum et malesuada fames ac ante ipsum primis in faucibus."),
          _divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ImobPage(
      hasBackButton: true,
      body: _body(),
    );
  }
}
