import 'package:call_log/call_log.dart';
import 'package:equatable/equatable.dart';

class CallLogEntity extends Equatable {
  final String name;
  final String number;
  final CallType callType;
  final DateTime dateTime;
  final Duration duration;
  const CallLogEntity({
    required this.name,
    required this.number,
    required this.callType,
    required this.dateTime,
    required this.duration,
  }) : super();

  @override
  List<Object?> get props => [name, number, callType, dateTime, duration];
}