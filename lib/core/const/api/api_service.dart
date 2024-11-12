import 'package:tv_artinokta/core/const/api/app_endpoint.dart';
import 'package:tv_artinokta/core/const/api/base/item_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tv_artinokta/feature/dashboard/utils/dto/dashboard_dto.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

//! REST API
  /// DASHBOARD
  @GET(AppEndpoint.getDashboardData)
  Future<ItemDto<DashboardData>> getDashboardData();
}
