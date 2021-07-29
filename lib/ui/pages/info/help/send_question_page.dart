import 'package:flutter/material.dart';
import 'package:imob_design_system/imob_design_system.dart';

class SendQuestionPage extends StatefulWidget {
  @override
  _SendQuestionPageState createState() => _SendQuestionPageState();
}

class _SendQuestionPageState extends State<SendQuestionPage> {
  final _formKey = GlobalKey<FormState>();
  var _name;
  var _surname;
  var _email;
  var _phone;
  var _title;
  var _description;

  var _validate = false;

  _appBar() {
    return AppBar(
      title: Column(
        children: [
          Text("Base App"),
        ],
      ),
      centerTitle: true,
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Enviar pergunta",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3E4A65),
                  ),
                ),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Insira o Nome';
                }
              },
              onSaved: (value) {
                setState(() {
                  _name = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(
                    color: Color(0xFFC5CFD4),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Insira o sobrenome';
                }
              },
              onSaved: (value) {
                setState(() {
                  _surname = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Sobrenome',
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(
                    color: Color(0xFFC5CFD4),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              // validator: ,
              onSaved: (value) {
                setState(() {
                  _email = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(
                    color: Color(0xFFC5CFD4),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              // validator: ,
              onSaved: (value) {
                setState(() {
                  _phone = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Telefone',
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(
                    color: Color(0xFFC5CFD4),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              // validator: ,
              onSaved: (value) {
                setState(() {
                  _title = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Título da Pergunta',
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(
                    color: Color(0xFFC5CFD4),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 5,
              // validator: ,
              onSaved: (value) {
                setState(() {
                  _description = value;
                });
              },
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                labelText: 'Descrição',
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(
                    color: Color(0xFFC5CFD4),
                  ),
                ),
              ),
            ),
            (_validate == false)
                ? SizedBox(height: 40)
                : Container(
                    alignment: Alignment.center,
                    height: 50,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: Color(0xFF64DFAD),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      "Parabéns! Sua pergunta foi enviada e em breve será respondida por um de nossos consultores.",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 55,
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text(
                  "Enviar",
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    setState(() {
                      _validate = true;
                    });
                    print("sucess");
                    print(
                        "$_name \n $_surname $_email $_phone \n $_title \n $_description");
                  } else {
                    setState(() {
                      _validate = false;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF3E4A65),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
            ),
          ],
        ),
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
