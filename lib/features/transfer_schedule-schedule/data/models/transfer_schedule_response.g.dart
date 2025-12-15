// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferScheduleResponse _$TransferScheduleResponseFromJson(
  Map<String, dynamic> json,
) => TransferScheduleResponse(
  message: json['message'] as String,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$TransferScheduleResponseToJson(
  TransferScheduleResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
};
