import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final void Function(int) onTap;
  const BottomNavigationBarWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_page),
          label: 'Contact',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.recent_actors),
          label: 'task',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call),
          label: 'call log',
        ),
      ],
    );
  }
}
