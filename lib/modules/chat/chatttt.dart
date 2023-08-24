import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:event_bus/event_bus.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];
  final EventBus _eventBus = EventBus();



  String token= '1|z9rV7KGntbDX9QaTnYXL0y8o2HkSV5wCeYbqk2Cy';

  @override
  void initState() {
    super.initState();
    initPusher();
    _eventBus.on<String>().listen((message) {
      setState(() {
        _messages.insert(0, message);
      });
    });
    _fetchMessages();
  }

  Future<void> initPusher() async {
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    await pusher.init(
        apiKey: '93e32b6021c51a21fd94',
        cluster: 'mt1',
        authEndpoint: 'https://sobhdesign.com/broadcasting/auth',
        onAuthorizer: (channelName, socketId, options) => ChatApp(),
    );
    PusherChannel channel = await pusher.subscribe(
        channelName: 'private-chat.${'1'}.${'2'}',
        onEvent: (PusherEvent event) {
          log("onEvent: $event");
        }
    );

    await pusher.connect();


  }
  void onEvent(PusherEvent event) {
    log("onEvent: $event");
  }


  /*void _initializePusher() {
    _pusher = PusherClient(
      '93e32b6021c51a21fd94',
      autoConnect: false,
      PusherOptions(
        host: 'https://sobhdesign.com/',
        wsPort: 6001,
        cluster: 'mt1',
        encrypted: true,
        auth: PusherAuth(
          'https://sobhdesign.com/broadcasting/auth',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      ),
      enableLogging: true,
    );

    _channel = _pusher.subscribe('private-chat.${'1'}.${'2'}');
    _channel.bind('.private-chat', (event) {
      print(event);
      //final message = event?.data?['content'].toString();
      //_eventBus.fire(message);
      _pusher.onConnectionStateChange((state) {
        log("previousState: ${state?.previousState}, currentState: ${state?.currentState}");
      });

      _pusher.onConnectionError((error) {
        log("error: ${error?.message}");
      });

    });

    _pusher.connect();
  }*/

  Future<void> _fetchMessages() async {
    final response = await http.get(Uri.parse('https://sobhdesign.com/api/v1/mentor/chat/messages?id=1'));
    final data = response.body;
    final messages = data as List<dynamic>;
    setState(() {
      _messages.clear();
      _messages.addAll(messages.reversed.map<String>((dynamic item) => item['content'].toString()));
      print(response.toString());
    });
  }

/*  Future<void> _sendMessage() async {
    final message = _messageController.text;
    _messageController.clear();

    final response = await http.post(Uri.parse('https://sobhdesign.com/api/v1/'),
        body: {'content': message});
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final sentMessage = data['content'].toString();
      final messageId = sentMessage.hashCode; // Use the hash code as an identifier
      _eventBus.fire(messageId);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Chat App'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_messages[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Enter a message',
                      ),
                    ),
                  ),
              /*    ElevatedButton(
                    onPressed: _sendMessage,
                    child: const Text('Send'),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}