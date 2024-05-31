import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vendedor_tienda/blocs/preferences/preferences_bloc.dart';
import 'package:vendedor_tienda/repository/preferences_repository_impl.dart';

import 'app.dart';
import 'blocs/BlocObserver.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data = await PlatformAssetBundle().load('assets/ca/letsencryptr3');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  final preferencesRepository = PreferenceRepositoryImpl();
  final preferencesBloc =
      PreferencesBloc(preferencesRepository: preferencesRepository);

  preferencesBloc.stream
      .firstWhere((state) => state is PreferenceLoaded)
      .then((_) => runApp(App(
            preferencesRepository: preferencesRepository,
            preferencesBloc: preferencesBloc,
          )));

  // Isolate.spawn(isoltetest, 1);

  preferencesBloc.add(LoadPreferences());
}

void isoltetest(int time) {
  Timer.periodic(const Duration(seconds: 10), (timer) {
    print('time prom insolate ${timer.isActive}');
  });
}
