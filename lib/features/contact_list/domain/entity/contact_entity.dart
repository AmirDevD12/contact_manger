import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String displayName;
  final String phoneNumber;

  Contact({required this.displayName, required this.phoneNumber});

  @override
  List<Object?> get props => [displayName, phoneNumber];
}
