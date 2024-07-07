
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:call_log/call_log.dart';


part 'call_log_model.freezed.dart';
part 'call_log_model.g.dart';

@freezed
class CallLogModel with _$CallLogModel  {
  const factory CallLogModel({
    required String name,
    required String number,
    required CallType callType,
    required DateTime dateTime,
    required Duration duration,
  }) = _CallLogModel;

  factory CallLogModel.fromCallLogEntry(CallLogEntry entry) {
    return CallLogModel(
      name: entry.name ?? '',
      number: entry.number ?? '',
      callType: entry.callType??CallType.unknown,
      dateTime: DateTime.fromMillisecondsSinceEpoch(entry.timestamp ?? 0),
      duration: Duration(seconds: entry.duration ?? 0),
    );
  }

  factory CallLogModel.fromJson(Map<String, dynamic> json) => _$CallLogModelFromJson(json);
}
