import 'package:get_it/get_it.dart';
import '../api/cat_api.dart';
import '../states/cats_state.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<CatApi>(CatApi());
  getIt.registerSingleton<CatsState>(CatsState());
}
