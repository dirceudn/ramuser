import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ranuser/app.dart';
import 'package:ranuser/app_observer.dart';


void main() {
  Bloc.observer = AppBlocObserver();
  runApp(AppPage());
  FlutterError.onError = (details) {
    log(details.exceptionAsString());
  };

  runZonedGuarded(
    () => runApp(AppPage()),
    (Object error, StackTrace stack) => log(error.toString()),
  );
}
