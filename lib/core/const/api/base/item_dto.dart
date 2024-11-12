import 'package:tv_artinokta/core/const/api/base/error_dto.dart';

class ItemDto<T> {
  final T? data;
  final String? message;
  final bool success;
  final ErrorDto? error;

  const ItemDto({required this.data, required this.message, required this.success, this.error});

  factory ItemDto.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ItemDto<T>(
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      message: json['message'] as String?,
      success: json['success'] as bool,
      error: json['error'] != null ? ErrorDto.fromJson(json['error'] as Map<String, dynamic>) : null,
    );
  }
}
