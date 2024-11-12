import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_artinokta/core/const/api/api_service.dart';
import 'package:tv_artinokta/core/utils/base_controller.dart';
import 'package:tv_artinokta/core/utils/dio_manager/dio_manager.dart';
import 'package:tv_artinokta/feature/dashboard/provider/dashboard_provider.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //? Network
  //?Network
  sl.registerLazySingleton<Dio>(() => DioManager.restApi());

  sl.registerLazySingleton(() => ApiService(sl()));

  //* Base
  sl.registerLazySingleton<BaseController>(() => BaseController());

  sl.registerLazySingleton<DashboardProvider>(() => DashboardProvider());
}
