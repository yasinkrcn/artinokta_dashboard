import 'package:tv_artinokta/core/const/api/base/error_dto.dart';

class ListDto<T> {
  final List<T> data;
  final String message;
  final bool success;
  final ErrorDto? error;

  const ListDto({required this.data, required this.message, required this.success, this.error});

  factory ListDto.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ListDto<T>(
      data: (json['data'] as List<dynamic>).map((e) => fromJsonT(e)).toList(),
      message: json['message'] as String,
      success: json['success'] as bool,
      error: json['error'] != null ? ErrorDto.fromJson(json['error'] as Map<String, dynamic>) : null,
    );
  }
}
