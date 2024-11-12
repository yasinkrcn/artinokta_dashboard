// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) =>
    DashboardData(
      customers:
          CustomerData.fromJson(json['customers'] as Map<String, dynamic>),
      dailySales:
          SalesData.fromJson(json['dailySales'] as Map<String, dynamic>),
      supplyCount: (json['supplyCount'] as num).toInt(),
      chartData: (json['chartData'] as List<dynamic>)
          .map((e) => ChartData.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdate: DateTime.parse(json['lastUpdate'] as String),
    );

Map<String, dynamic> _$DashboardDataToJson(DashboardData instance) =>
    <String, dynamic>{
      'customers': instance.customers,
      'dailySales': instance.dailySales,
      'supplyCount': instance.supplyCount,
      'chartData': instance.chartData,
      'lastUpdate': instance.lastUpdate.toIso8601String(),
    };

CustomerData _$CustomerDataFromJson(Map<String, dynamic> json) => CustomerData(
      total: (json['total'] as num).toInt(),
      today: (json['today'] as num).toInt(),
      lastWeekTotal: (json['lastWeekTotal'] as num).toInt(),
    );

Map<String, dynamic> _$CustomerDataToJson(CustomerData instance) =>
    <String, dynamic>{
      'total': instance.total,
      'today': instance.today,
      'lastWeekTotal': instance.lastWeekTotal,
    };

SalesData _$SalesDataFromJson(Map<String, dynamic> json) => SalesData(
      liters: (json['liters'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$SalesDataToJson(SalesData instance) => <String, dynamic>{
      'liters': instance.liters,
      'amount': instance.amount,
    };

ChartData _$ChartDataFromJson(Map<String, dynamic> json) => ChartData(
      date: DateTime.parse(json['date'] as String),
      liters: (json['liters'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$ChartDataToJson(ChartData instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'liters': instance.liters,
      'amount': instance.amount,
    };
