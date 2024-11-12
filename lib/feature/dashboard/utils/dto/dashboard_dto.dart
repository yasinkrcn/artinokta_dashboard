import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tv_artinokta/core/const/api/api_service.dart';
import 'package:tv_artinokta/core/const/api/base/item_dto.dart';
import 'package:tv_artinokta/core/error/failure.dart';
import 'package:tv_artinokta/core/utils/api_request.dart';
import 'package:tv_artinokta/core/utils/dio_manager/dio_manager.dart';

part 'dashboard_dto.g.dart';

@JsonSerializable()
class DashboardData {
  final CustomerData customers;
  final SalesData dailySales;
  final int supplyCount;
  final List<ChartData> chartData;
  final DateTime lastUpdate;

  DashboardData({
    required this.customers,
    required this.dailySales,
    required this.supplyCount,
    required this.chartData,
    required this.lastUpdate,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) => _$DashboardDataFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardDataToJson(this);

  /// getDashboardData
  static Future<Either<Failure, ItemDto<DashboardData>>> getDashboardData() async {
    final dashboardEither = await ApiHelper.requestItem<DashboardData>(
      apiCall: () => ApiService(DioManager.restApi()).getDashboardData(),
    );

    return dashboardEither;
  }
}

@JsonSerializable()
class CustomerData {
  final int total;
  final int today;
  final int lastWeekTotal;

  CustomerData({
    required this.total,
    required this.today,
    required this.lastWeekTotal,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) => _$CustomerDataFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerDataToJson(this);
}

@JsonSerializable()
class SalesData {
  final int liters;
  final int amount;

  SalesData({
    required this.liters,
    required this.amount,
  });

  factory SalesData.fromJson(Map<String, dynamic> json) => _$SalesDataFromJson(json);

  Map<String, dynamic> toJson() => _$SalesDataToJson(this);
}

@JsonSerializable()
class ChartData {
  final DateTime date;
  final int liters;
  final int amount;

  ChartData({
    required this.date,
    required this.liters,
    required this.amount,
  });

  factory ChartData.fromJson(Map<String, dynamic> json) => _$ChartDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChartDataToJson(this);
}
