import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  final String message;

  // ignore: use_key_in_widget_constructors
  const NoDataFound(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
          alignment: Alignment.center,
          child: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.blueAccent, fontSize: 28.0),
            ),
          )),
    );
  }
}
