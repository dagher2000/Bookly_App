import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
      // TODO: Handle this case.
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to  ApiServer was canced');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexepected error, please try again!');
      default:
        return ServerFailure('Opps There was an error');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic responce) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(responce['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error');
    } else {
      return ServerFailure('Opps There was an error');
    }
  }
}
