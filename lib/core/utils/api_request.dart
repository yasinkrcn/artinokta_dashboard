import 'package:tv_artinokta/core/const/api/base/item_dto.dart';
import 'package:tv_artinokta/core/const/api/base/list_dto.dart';
import 'package:tv_artinokta/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ApiHelper {
  /// Request item data from API
  static Future<Either<Failure, ItemDto<T>>> requestItem<T>({
    required Future<ItemDto<T>> Function() apiCall,
  }) async {
    try {
      final result = await apiCall();

      if (result.success) {
        return Right(result);
      } else {
        return Left(ServiceFailure(errorText: result.message));
      }
    } catch (err) {
      return Left(ServiceFailure(errorText: "Error : $err"));
    }
  }

  /// Request list data from API
  static Future<Either<Failure, ListDto<T>>> requestList<T>({
    required Future<ListDto<T>> Function() apiCall,
  }) async {
    try {
      final result = await apiCall();
      if (result.success) {
        return Right(result);
      } else {
        return Left(ServiceFailure(errorText: result.message));
      }
    } catch (err) {
      return Left(ServiceFailure(errorText: "$err"));
    }
  }
}
