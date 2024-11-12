class ErrorDto {
  final String? errorCode;
  final String? errorMessage;

  ErrorDto({
    required this.errorCode,
    required this.errorMessage,
  });

  factory ErrorDto.fromJson(Map<String, dynamic> json) {
    return ErrorDto(
      errorCode: json['errorCode'],
      errorMessage: json['errorMessage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'errorCode': errorCode,
      'errorMessage': errorMessage,
    };
  }
}
