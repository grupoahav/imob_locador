import 'package:flutter/material.dart';
import 'package:imob_design_system/colors/colors.dart';

extension ImobTextExtension on Text {
  Text toAppBarH1({TextStyle? style}) {
    const defaultStyle = TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: ImobColors.titleColor);
    return Text(
      data!,
      key: key,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
      style: (this.style ?? defaultStyle).merge(style ?? defaultStyle),
    );
  }

  Text toAppBarH6({TextStyle? style}) {
    const defaultStyle = TextStyle(
        fontWeight: FontWeight.w400,
        color: ImobColors.textColor);
    return Text(
      data!,
      key: key,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
      style: (this.style ?? defaultStyle).merge(style ?? defaultStyle),
    );
  }
}
