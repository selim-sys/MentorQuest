import 'package:consultation_gp/shared/methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../account Setting/account_setting.dart';
import '../mentor_profile_setting/profile_setting.dart';
import '../payment_details/payment_info.dart';
import '../schedule_timings/schedule_time.dart';

class MentorSettings extends StatefulWidget {
  @override
  _MentorSettingsState createState() => _MentorSettingsState();
}

class _MentorSettingsState extends State<MentorSettings> {
  int selectedButtonIndex = -1;
  List<bool> isSelected = [false, false, false, false];

  List<String> buttonNames = [
    'Personal Information',
    'Schedule Timings',
    'Payment Information',
    'Account Settings'
  ];

  List<IconData> buttonIcons = [
    Icons.person,
    Icons.calendar_today,
    Icons.account_balance_wallet,
    Icons.account_box_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Container(
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
          SafeArea(
            child: Padding(
              padding:  EdgeInsets.only(left: 25.0.r,right: 25.0.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: buildButton(0, (){
                            navigateTo(context, ProfileSetting());
                          }),
                        ),
                        SizedBox(width: 1.5.w),
                        Expanded(
                          child: buildButton(1, (){
                            navigateTo(context, ScheduleTimings());
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: buildButton(2, (){
                            navigateTo(context, PaymentInfo());
                          }),
                        ),
                        SizedBox(width: 1.5.w),
                        Expanded(
                          child: buildButton(3, (){
                            navigateTo(context, AccountSettingsScreen());
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(int index, Function function) {
    return Padding(
      padding:  EdgeInsets.all(10.0.r),
      child: Container(

        height: 350,
        child: ElevatedButton(

          onPressed: () {
            setState(() {
              selectedButtonIndex = index;
              isSelected = List.generate(buttonNames.length, (i) => i == index);
              function();
            });
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: BorderSide(
                  color: isSelected[index] ? Colors.lightBlueAccent : Colors.white,
                ),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              isSelected[index] ? Colors.lightBlueAccent : Colors.white,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                buttonIcons[index],
                size: 30.sp,
                color: isSelected[index] ? Colors.white : Colors.lightBlueAccent,
              ),
               SizedBox(height: 8.h,),
              Text(
                buttonNames[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: isSelected[index] ? Colors.white : Colors.lightBlueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

