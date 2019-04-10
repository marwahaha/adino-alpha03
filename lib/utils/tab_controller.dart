import 'package:flutter/material.dart';

import '../pages/chat_page.dart';
import '../pages/notification_page.dart';


class DTabController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(child: Text("Notifications")),
                Tab(child: Text("Chat"))
              ],
            ),
            title: Text('Connections', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          body: TabBarView(
            children: [
              NotificationPage(),
              ChatPage(),
            ],
          ),
        ),
      ),
    );
  }
}