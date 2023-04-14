import 'package:get_it/get_it.dart';
import 'package:oonzoo_assignment/view/home_screen/model/home_model.dart';
import 'package:oonzoo_assignment/view/home_screen/service/home_service.dart';

GetIt locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<HomeModel>(() => HomeModel());
  locator.registerLazySingleton<HomeService>(() => HomeService());
}
