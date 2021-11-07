import 'package:flutter/material.dart';
import 'package:ranuser/presentation/coreui/colors.dart';
import 'package:ranuser/presentation/coreui/core_constants.dart';
import 'package:ranuser/presentation/coreui/text.dart';

Row rowHeading(var label) {
  return Row(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Text(label,
            style: const TextStyle(
                color: t1_colorPrimary, fontSize: 18, fontFamily: 'Bold'),
            textAlign: TextAlign.left),
      ),
    ],
  );
}

Row profileText(var label, {var maxline = 1}) {
  return Row(
    children: <Widget>[
      Padding(padding: const EdgeInsets.fromLTRB(20, 0, 10, 0), child: text(label, fontSize: textSizeLargeMedium, textColor: t1TextColorPrimary, maxLine: maxline)),
    ],
  );
}


