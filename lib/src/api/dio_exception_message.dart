import 'package:dio/dio.dart';

class DioExceptionMessage implements Exception {
  late String errorMessage;

  DioExceptionMessage.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        errorMessage = "The request was canceled. Please try again.";
        break;
      case DioExceptionType.badCertificate:
        errorMessage = "There was an issue with the security certificate.";
        break;
      case DioExceptionType.connectionError:
        errorMessage =
            'It seems you are offline. Please check your internet connection.';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = "The connection took too long. Please try again later.";
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "The server took too long to respond. Please try again.";
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "The request took too long to send. Please try again.";
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioError.response?.statusCode);
        break;
      case DioExceptionType.unknown:
        errorMessage = 'An unexpected error occurred. Please try again later.';
        break;
      default:
        errorMessage = 'Oops something went wrong!';
        break;
    }
  }

  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'There was an error with your request. Please check and try again.';
      case 401:
        return 'You are not authorized to perform this action. Please log in and try again.';
      case 403:
        return 'You do not have permission to access this resource.';
      case 404:
        return 'The resource you are looking for could not be found.';
      case 500:
        return 'There was an issue with the server. Please try again later.';
      default:
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString() => errorMessage;
}
