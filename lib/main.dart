import 'dart:async' as BlocOverrides;
import 'dart:ui';

import 'package:dashboard/shared/data_source/auth_locater.dart';
import 'package:dashboard/shared/data_source/dataLocater.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  Bloc.observer = AppBlocObserver(); // هنا التغيير
  if (kDebugMode) {
    Bloc.observer = DebugBlocObserver();
  }
  
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await setup();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

Future<void> setup() async {
  await GetStorage.init();

  GetIt.I.registerSingletonAsync<AuthLocater>(() async {
    final x = AuthLocater()..loadData();

    return x;
  });
  GetIt.I.registerLazySingleton<DataLocater>(() => DataLocater());
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} $change');
  }
}

class DebugBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('Bloc created: ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('Change in ${bloc.runtimeType}: $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('Error in ${bloc.runtimeType}: $error');
    super.onError(bloc, error, stackTrace);
  }
}
