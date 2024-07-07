import 'package:contact_manger/core/resources/data_state.dart';
import 'package:dio/dio.dart';

import 'app_exception.dart';

class CheckExceptions {
  static dynamic response(Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response: response);
      case 401:
        throw UnauthorisedException();
      case 404:
        throw NotFoundException();
      case 500:
        throw ServerException();
      default:
        throw FetchDataException(
            message: "${response.statusCode}fetch exception");
    }
  }

  static dynamic getError(AppException appException) async {
    switch (appException.runtimeType) {
      case BadRequestException:
        return DataFailed(appException.message);

      case NotFoundException:
        return DataFailed(appException.message);

      case UnauthorisedException:
        ///for refresh token

        return DataFailed(appException.message);

      case ServerException:
        return DataFailed(appException.message);

      case FetchDataException:
        return DataFailed(appException.message);
    }
  }
}
