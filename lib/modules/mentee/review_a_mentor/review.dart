import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewPage extends StatefulWidget {
  final String name;
  final String photoUrl;

  ReviewPage({required this.name, required this.photoUrl});

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  double _rating = 0.0;
  TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(' Review your mentor')),
      ),
      body: Stack(
        children:[
          Container
            (
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: <Color>
                      [
                        Colors.blue,
                        Colors.white10
                      ],
                      tileMode: TileMode.mirror
                  )
              )
          ),

          Container(
          padding: EdgeInsets.all(30.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 24.0.r,
                    backgroundImage: NetworkImage(widget.photoUrl),
                  ),
                  SizedBox(width: 16.0.w),
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 24.0.sp),
                  ),
                ],
              ),
              SizedBox(height: 16.0.h),
              Text(
                'Rating',
                style: TextStyle(fontSize: 16.0.sp),
              ),
              SizedBox(height: 8.0.h),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 8.0.w),
                  Slider(

                    inactiveColor: Colors.white,

                    value: _rating,
                    min:0.0,
                    max: 5.0,
                    divisions: 5,
                    onChanged: (value) {
                      setState(() {
                        _rating = value;
                      });
                    },
                  ),
                  SizedBox(width: 8.0.w),
                  Text(
                      style: TextStyle(color: Colors.white,fontSize: 16.0.sp),
                      '$_rating' ),

                ],
              ),
              SizedBox(height: 16.0.h),
              Text(
                'Review',
                style: TextStyle(fontSize: 16.0.sp),
              ),
              SizedBox(height: 8.0.h),
              TextFormField(
                controller: _reviewController,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Write your review here',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0.h),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Save rating and review
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
