import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';


class CallTypeIcon extends StatelessWidget {
  final CallType callType;

  const CallTypeIcon({super.key, required this.callType});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> iconData;

    switch (callType) {
      case CallType.outgoing:
        iconData = {"color": Colors.green, 'icon': Icons.call_made_rounded};
        break;
      case CallType.missed:
        iconData = {"color": Colors.red, 'icon': Icons.call_missed_rounded};
        break;
      case CallType.incoming:
        iconData = {"color": Colors.green, 'icon': Icons.call_received_rounded};
        break;
      case CallType.rejected:
        iconData = {
          "color": Colors.grey,
          'icon': Icons.remove_circle_outline_rounded
        };
        break;
      default:
        iconData = {
          "color": Colors.grey,
          'icon': Icons.report_problem_rounded
        };
    }

    return Icon(
      iconData["icon"],
      color: iconData['color'],
      size: 20,
    );
  }
}
