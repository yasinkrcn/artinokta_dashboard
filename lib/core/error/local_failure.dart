import 'package:tv_artinokta/core/error/failure.dart';

class GetFailure extends Failure {
  @override
  String get message => "Get Failure Error";
}

class SaveFailure extends Failure {
  @override
  String get message => "Save Failure Error";
}

class RemoveFailure extends Failure {
  @override
  String get message => "Remove Failure Error";
}
