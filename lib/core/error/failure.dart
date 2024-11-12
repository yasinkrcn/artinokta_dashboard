abstract class Failure {
  final String? errorText;

  Failure({this.errorText});

  String get message => errorText ?? "Bir sorun oluştu";
}

extension FailureExtension on Failure {}

class AppSnackBar {}

class ServiceFailure extends Failure {
  ServiceFailure({super.errorText});
}

class CustomFailure extends Failure {
  CustomFailure({super.errorText});
}
