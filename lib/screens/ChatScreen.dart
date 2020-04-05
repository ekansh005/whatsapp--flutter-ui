import 'package:flutter/material.dart';
import 'package:whatsapp/models/ChatListItem.dart';
import 'package:whatsapp/models/ChatMessage.dart';

class ChatScreen extends StatelessWidget {
  final ChatListItem person;

  ChatScreen(this.person);

  final List<ChatMessage> messages = [
    ChatMessage(
        date: "9:10 am", isSentByMe: true, message: "Bike Customer CFP Franc"),
    ChatMessage(
        date: "9:10 am",
        isSentByMe: true,
        message: "instruction set grey applications"),
    ChatMessage(
        date: "9:10 am",
        isSentByMe: false,
        message: "Monitored some long message"),
    ChatMessage(date: "9:10 am", isSentByMe: true, message: "local"),
    ChatMessage(
        date: "9:10 am",
        isSentByMe: false,
        message: "Functionality please be a little longer"),
    ChatMessage(
        date: "9:10 am", isSentByMe: true, message: "Bike Customer CFP Franc"),
    ChatMessage(
        date: "9:10 am",
        isSentByMe: true,
        message: "local why are you so short"),
    ChatMessage(date: "9:10 am", isSentByMe: false, message: "Functionality"),
    ChatMessage(
        date: "9:10 am",
        isSentByMe: true,
        message: "instruction set grey applications"),
    ChatMessage(
        date: "9:10 am", isSentByMe: false, message: "Monitored you too baby"),
  ];

  Widget renderChatMessage(ChatMessage chatMessage) {
    return Column(
      children: <Widget>[
        Align(
          alignment:
              chatMessage.isSentByMe ? Alignment.topRight : Alignment.topLeft,
          child: Container(
            child: Text(chatMessage.message),
            decoration: BoxDecoration(
              color: chatMessage.isSentByMe ? Color(0xFFDCF8C6) : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(1, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
          ),
        ),
      ],
    );
  }

  Widget renderTextBox(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(25),
                right: Radius.circular(25),
              ),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.face),
                  onPressed: () {},
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
        FloatingActionButton(
          mini: true,
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.keyboard_voice,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECE5DD),
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(person.profileURL),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  person.personName,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "last seen today at 12:22",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.videocam,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.call,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (ctx, i) => renderChatMessage(messages[i]),
            ),
          ),
          Divider(),
          Container(
            child: renderTextBox(context),
          )
        ],
      ),
    );
  }
}
