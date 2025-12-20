import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final Map<String, dynamic>? errors;

  ApiErrorModel({this.message, this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  /// Return a String containing all the error messages
  String getAllErrorMessages() {
    if (errors != null && errors!.isNotEmpty) return message ?? 'حدث خطأ ما';
    final errorMessage = errors!.entries
        .map((entry) {
          final value = entry.value;
          return "${value.join(',')}";
        })
        .join('\n');
    return errorMessage;
  }

  //   String getAllErrorMessages() {
  //     if (errors != null && errors!.isNotEmpty) {
  //       final errorMessage = errors!.entries.map((entry) {
  //         final value = entry.value;
  //         if (value is List) {
  //           return value.join('. ');
  //         }
  //         // return value.toString();
  //         return "${value.join(',')}";
  //       }).join('\n');
  //       return errorMessage;
  //     }
  //     return "حدث خطا ما";
  //   }
}
