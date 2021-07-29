import 'package:flutter/material.dart';

class ScoreBarView extends StatelessWidget {
  const ScoreBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      child: Stack(
        children: [
          _line(),
          _value(),
        ],
      ),
    );
  }

  _value() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: Text(
          "630",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
          textAlign: TextAlign.center,
        )),
      ],
    );
  }

  _line() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 9,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              color: Colors.lightGreen,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
