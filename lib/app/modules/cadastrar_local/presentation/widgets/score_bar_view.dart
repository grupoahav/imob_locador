import 'package:flutter/material.dart';
import 'package:imob_design_system/imob_design_system.dart';

class ScoreBarView extends StatelessWidget {
  const ScoreBarView({Key? key, required this.score}) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // Size of Screen - padding horizontal
    final double maxSize = MediaQuery.of(context).size.width - 48.scale;
    const double maxScore = 1000;
    late final Color colorBar;
    late final Color colorTextNumber;
    final double sizeBar = maxSize * score / maxScore;

    if (score < maxScore / 3) {
      colorBar = ImobColors.red;
      colorTextNumber = ImobColors.red;
    } else if (score > maxScore / 3 * 2) {
      colorBar = ImobColors.green;
      colorTextNumber = ImobColors.white;
    } else {
      colorBar = ImobColors.yellow;
      colorTextNumber = ImobColors.black;
    }

    return SizedBox(
      height: 14.scale,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 14.scale,
                width: sizeBar,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: colorBar,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                score.toString(),
                style: theme.textTheme.overline!.merge(
                  TextStyle(
                    color: colorTextNumber,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
