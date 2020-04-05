import 'package:flutter/material.dart';
import 'package:whatsapp/config/config.dart';
import 'package:whatsapp/tabs/CallsTab.dart';
import 'package:whatsapp/tabs/CameraTab.dart';
import 'package:whatsapp/tabs/ChatsTab.dart';
import 'package:whatsapp/tabs/StatusTab.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primaryColor: darkGreen,
        accentColor: lightGreen,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'WhatsApp',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null),
            IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: null),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CameraTab(),
            ChatsTab(),
            StatusTab(),
            CallsTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: Theme.of(context).accentColor,
          child: IconButton(
            icon: Icon(
              Icons.chat,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ),
      ),
    );
  }
}
