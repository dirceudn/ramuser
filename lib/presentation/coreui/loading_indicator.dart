import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final LoadingTypeIndicator typeIndicator;

  // ignore: use_key_in_widget_constructors
  const LoadingIndicator({required this.typeIndicator});

  @override
  Widget build(BuildContext context) {
    if (typeIndicator is CircularProgressType) {
      return const CircularProgressIndicator(
        strokeWidth: 1.0,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
      );
    } else if (typeIndicator is LinearProgressType) {
      return const LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey));
    }

    return const LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey));
  }
}

abstract class LoadingTypeIndicator extends Equatable {}

class CircularProgressType extends LoadingTypeIndicator {
  @override
  List<Object?> get props => ["CircularProgressType"];
}

class LinearProgressType extends LoadingTypeIndicator {
  @override
  List<Object?> get props => ["CircularProgressType"];
}
