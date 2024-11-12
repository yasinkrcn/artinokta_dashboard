import 'package:tv_artinokta/core/error/failure.dart';

class NullPointerFailure extends Failure {
  NullPointerFailure({super.errorText});
  @override
  String get message => errorText ?? "Data equals null";
}
