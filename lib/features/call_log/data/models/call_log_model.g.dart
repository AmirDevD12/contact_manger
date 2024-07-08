// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallLogModelImpl _$$CallLogModelImplFromJson(Map<String, dynamic> json) =>
    _$CallLogModelImpl(
      name: json['name'] as String,
      number: json['number'] as String,
      callType: $enumDecode(_$CallTypeEnumMap, json['callType']),
      dateTime: DateTime.parse(json['dateTime'] as String),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
    );

Map<String, dynamic> _$$CallLogModelImplToJson(_$CallLogModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'number': instance.number,
      'callType': _$CallTypeEnumMap[instance.callType]!,
      'dateTime': instance.dateTime.toIso8601String(),
      'duration': instance.duration.inMicroseconds,
    };

const _$CallTypeEnumMap = {
  CallType.incoming: 'incoming',
  CallType.outgoing: 'outgoing',
  CallType.missed: 'missed',
  CallType.voiceMail: 'voiceMail',
  CallType.rejected: 'rejected',
  CallType.blocked: 'blocked',
  CallType.answeredExternally: 'answeredExternally',
  CallType.unknown: 'unknown',
  CallType.wifiIncoming: 'wifiIncoming',
  CallType.wifiOutgoing: 'wifiOutgoing',
};
