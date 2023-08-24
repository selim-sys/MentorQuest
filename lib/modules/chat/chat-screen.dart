import 'package:consultation_gp/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

//class for every msg
class Message{
  final String text;
  final DateTime date;
  final bool isSentByMe;
  const Message({
    required this.text,
    required this.date,
    required this.isSentByMe
});
}

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //list of msgs
  List<Message> messages = [
    Message(
      text: "hey",
      date: DateTime.now().subtract(Duration(minutes: 33)),
      isSentByMe: false
    ),
    Message(
        text: "hii",
        date: DateTime.now().subtract(Duration(minutes: 53)),
        isSentByMe: true
    ),
    Message(
        text: "How are u?",
        date: DateTime.now().subtract(Duration(minutes: 23)),
        isSentByMe: false
    ),
    Message(
        text: "all good wbu?",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true
    ),
    Message(
        text: "hey",
        date: DateTime.now().subtract(Duration(minutes: 33)),
        isSentByMe: false
    ),
    Message(
        text: "hii",
        date: DateTime.now().subtract(Duration(minutes: 53)),
        isSentByMe: true
    ),
    Message(
        text: "How are u?",
        date: DateTime.now().subtract(Duration(minutes: 23)),
        isSentByMe: false
    ),
    Message(
        text: "all good wbu?",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true
    ),
    Message(
        text: "hey",
        date: DateTime.now().subtract(Duration(minutes: 33)),
        isSentByMe: false
    ),
    Message(
        text: "hii",
        date: DateTime.now().subtract(Duration(minutes: 53)),
        isSentByMe: true
    ),
    Message(
        text: "How are u?",
        date: DateTime.now().subtract(Duration(minutes: 23)),
        isSentByMe: false
    ),
    Message(
        text: "all good wbu?",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: true
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white10,
              backgroundImage: NetworkImage("https://img.uxwing.com/wp-content/themes/uxwing/download/peoples-avatars-thoughts/man-person-icon.png"),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                style: TextStyle(
                  color: Colors.blue
                ),
                  'Mohamed Selim'),
            ),
          ],
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: IconButton(
            onPressed: (){},
            icon: Icon(
              color: Colors.blue,
                Icons.arrow_back),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>
              (
              padding: EdgeInsetsDirectional.all(25.w),
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              elements: messages,
              groupBy: (message) => DateTime(
                message.date.year,
                message.date.month,
                message.date.day
              ) ,
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40.h,
                child: Center(
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: EdgeInsetsDirectional.all(8),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Align(
                alignment: message.isSentByMe
                ? Alignment.centerRight
                : Alignment.centerLeft,
                child: Card(
                  color: message.isSentByMe
                      ? Theme.of(context).primaryColor
                      : Colors.white  ,
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsetsDirectional.all(12),
                    child: Text(message.text),
                  ),
                ),
              ),
            )
            ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){

              }, icon: Icon(
                  color: Theme.of(context).primaryColor,
                  Icons.emoji_emotions_rounded
              )),
              Container(
                width: 200.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.shade200,
                ),

                child: TextField(
                  onSubmitted: (text){
                    final message = Message(
                        text: text,
                        date: DateTime.now(),
                        isSentByMe: true);
                    setState(() {
                      messages.add(message);
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsetsDirectional.all(12),
                    hintText: "Type your message here...",
                  ),
                ),
              ),
              IconButton(onPressed: (){

              }, icon: Icon(
                color: Theme.of(context).primaryColor,
                Icons.send
              ))
            ],
          )
        ],
      ),
    );
  }
}
