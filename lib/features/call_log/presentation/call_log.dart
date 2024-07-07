import 'package:contact_manger/features/call_log/presentation/widget/icon_call_type.dart';
import 'package:contact_manger/features/call_log/presentation/widget/title_call.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/call_log_controller.dart';

class CallLogScreen extends StatelessWidget {
  const CallLogScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Call Logs'),
        ),
        body: GetBuilder<CallLogController>(
          builder: (controller) {
            if (controller.status.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.status.isError) {
              return Center(
                  child:
                      Text(controller.status.errorMessage ?? 'Unknown error'));
            } else {
              return ListView.builder(
                itemCount: controller.state?.length ?? 0,
                itemBuilder: (context, index) {
                  final call = controller.state![index];
                  return ListTile(
                    leading: CallTypeIcon(
                      callType: call.callType,
                    ),
                    title: TitleCall(
                      name: call.name, number: call.number,
                    ),
                    subtitle: Text(
                        'Duration: ${controller.getTime(call.duration)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.call),
                      onPressed: () {
                        controller.callNumber(call.number );
                      },
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
