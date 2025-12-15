import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Failed to connect.");
        //  return ApiErrorModel(message: "فشل الاتصال بالخادم");
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "تم الغاء الاتصال بالخادم");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "انتهت مهلة الاتصال بالخادم");
        case DioExceptionType.unknown:
          return ApiErrorModel(message: "فشل الاتصال بالخادم بسبب مشاكل في الاتصال بالانترنت");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: "انتهت مهلة الاستلام في الاتصال بالحادم");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: "انتهت مهلة الارسال في الاتصال في الخادم");

        default:
          return ApiErrorModel(message: "حدث خطأ ما");
      }
    }


    else {

      return ApiErrorModel(message: "حدث خطا غير معروف");
    }
  }

}



// ApiErrorModel _handleError(dynamic data) {

//     return ApiErrorModel(
//         message: data['message']??"حدث خطا غير معروف",
//         errors: data['errors'],
//     );

// }

ApiErrorModel _handleError(dynamic data) {
  // 1. التحقق مما إذا كان هناك رسالة خطأ مباشرة (لحالات 400 Business Logic Errors)
  // الباك إند يرسل: {"success": false, "message": "You do not have enough balance..."}
  if (data is Map<String, dynamic>) {
    return ApiErrorModel(
      message: data['message'] ?? "حدث خطأ غير معروف",
      errors: data['errors'], // لحالات Validation Error 422
    );
  }
  
  return ApiErrorModel(message: "حدث خطأ غير معروف");
}