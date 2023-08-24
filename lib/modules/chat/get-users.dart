
import 'package:flutter/material.dart';

class Friend {
  final String name;
  final String image;
  final String lastMessage;
  final DateTime lastMessageDate;
  final VoidCallback onTap;


  Friend({
    required this.name,
    required this.image,
    required this.lastMessage,
    required this.lastMessageDate,
    required this.onTap
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
    );
  }

}

class GetUsersScreen extends StatelessWidget {
  final List<Friend> friends = [

    Friend(
      onTap: (){
       //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Container(),));
      },
      name: "Mohamed Selim",
      image: "https://img.uxwing.com/wp-content/themes/uxwing/download/peoples-avatars-thoughts/man-person-icon.png",
      lastMessage: "Hey, how are you?",
      lastMessageDate: DateTime.now().subtract(Duration(hours: 1)),

    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chats'),
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (BuildContext context, int index) {
          final friend = friends[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              backgroundImage: NetworkImage(friend.image),
            ),
            title: Text(friend.name),
            subtitle: Text(
              friend.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              _formatLastMessageDate(friend.lastMessageDate),
            ),
            onTap: () {
              // Handle friend item tap here
              print('Tapped on ${friend.name}');
            },
          );
        },
      ),
    );
  }

  String _formatLastMessageDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays >= 1) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}