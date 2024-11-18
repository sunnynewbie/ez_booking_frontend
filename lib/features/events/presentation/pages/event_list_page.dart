import 'package:ez_booking/features/events/controller/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EventController _controller = Get.put(EventController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event List'),
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (_controller.eventList.isEmpty) {
          return const Center(
            child: Text('No events found'),
          );
        }

        return ListView.builder(
          itemCount: _controller.eventList.length,
          itemBuilder: (context, index) {
            final event = _controller.eventList[index];
            return Card(
              key: ValueKey(event.eventId), // Ensure unique keys
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(event.eventName ?? 'Unnamed Event'),
                subtitle: Text(event.eventDesc ?? 'No description'),
                trailing: Text('\$${event.ticket?.toString() ?? 'N/A'}'),
                onTap: () {
                },
              ),
            );
          },
        );
      }),
    );
  }
}
