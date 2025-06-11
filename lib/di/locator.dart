import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../api/cat_api.dart';
import '../database/database.dart';
import '../states/cats_state.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Connectivity>(Connectivity());
  getIt.registerSingleton<AppDatabase>(AppDatabase());
  getIt.registerSingleton<CatApi>(CatApi());
  getIt.registerSingleton<CatsState>(
    CatsState(getIt<AppDatabase>(), getIt<CatApi>(), getIt<Connectivity>()),
  );
}
