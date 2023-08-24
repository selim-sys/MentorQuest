/*import 'package:flutter/material.dart';

class MentorRefuse extends StatefulWidget {
   MentorRefuse({Key? key}) : super(key: key);


  @override
  State<MentorRefuse> createState() => _MentorRefuseState();
}

class _MentorRefuseState extends State<MentorRefuse> {
  var selectedReason;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('Please, choose your refuse reason',
                style: TextStyle(
                fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 20.0,),
              DropdownButton(
                isExpanded: false,
                hint: Text('selact a message'),
                items: [
                  "Sorry, i am busy",
                  "I can't help you with your problem",
                  "I can't help you with your problem",
                  "Sorry, i am busy",
                ].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(),
                onChanged: (val){
                  setState(() {
                    selectedReason = val;
                  });
                },
                value: selectedReason,
                //menuMaxHeight: 60.0,
              ),

            ],
          ),
        ),
      ),
    );
  }
}*/
