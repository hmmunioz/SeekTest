import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:seektest/app/utils/localstorage.dart';
import 'package:seektest/app/utils/logger.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  final LocalStorageService storage = await LocalStorageService.storageInstance;

  getIt.registerLazySingleton(() => getLogger('Inyeccion'));
  getIt.registerSingleton<LocalStorageService>(storage);
}

Future<void> resetLocator() async {
  try {
    await getIt.reset();
    await setupLocator();
  } catch (ex) {
    debugPrint(ex.toString());
  }
}
