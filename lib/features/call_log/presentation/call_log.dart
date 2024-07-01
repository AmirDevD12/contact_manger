import 'package:call_log/call_log.dart';
import 'package:contact_manger/features/call_log/data/data_sorce/local/call_log_local.dart';
import 'package:contact_manger/features/call_log/presentation/widget/icon_call_type.dart';
import 'package:contact_manger/features/call_log/presentation/widget/title_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/call_log_controller.dart';

class CallLogScreen extends StatelessWidget {
  const CallLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CallLogController callLogController = Get.find<CallLogController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Logs'),
      ),
      body: Obx(() {
        if (callLogController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (callLogController.callLogs.isEmpty) {
          return const Center(child: Text('No call logs available'));
        } else {
          return FutureBuilder<Iterable<CallLogEntry>>(
            future: CallLogs().fetchCallLogs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No call logs found.'));
              } else {
                final callLogs = snapshot.data!.toList();
                return ListView.builder(
                  itemCount: callLogs.length,
                  itemBuilder: (context, index) {
                    final call = callLogs[index];
                    return ListTile(
                      leading: CallTypeIcon(
                        callType: call.callType ?? CallType.unknown,
                      ),
                      title: TitleCall(entry: call),
                      subtitle: Text(
                          'Duration: ${callLogController.getTime(call.duration ?? 0)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.call),
                        onPressed: () {
                          callLogController.callNumber(call.number ?? '');
                        },
                      ),
                    );
                  },
                );
              }
            },
          );
        }
      }),
    );
  }
}
