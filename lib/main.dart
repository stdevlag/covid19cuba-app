import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preferences/preference_service.dart';

import 'package:covid19cuba/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocSupervisor.delegate = SimpleBlocDelegate();

  await PrefService.init();

  return runApp(App());
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log(transition.toString());
  }
}
