import 'package:consultation_gp/modules/mentee/booking_steps/booking_details/booking_details.dart';
import 'package:consultation_gp/modules/mentee/mentor_exploration/all_mentors.dart';
import 'package:consultation_gp/modules/mentor/mentor_profile/mentor_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableTimes extends StatefulWidget {
   AvailableTimes({Key? key}) : super(key: key);

  @override
  State<AvailableTimes> createState() => _AvailableTimesState();
}

class _AvailableTimesState extends State<AvailableTimes> {
  Color cont =Colors.white;

  int i = 0;

  List <String> days=
  [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  List<String> day=
  [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  List<String> slots=
  [
    '09:00 Am - 10:00 Am',
    '09:00 Am - 8:00 Am',
    '09:00 Am - 7:00 Am',
    '09:00 Am - 8:00 Am',
    '09:00 Am - 6:00 Am',
    '09:00 Am - 3:00 Am',
    '09:00 Am - 1:00 Am',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 40.0.h,left: 30.0.w,right: 30.0.w,bottom: 40.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 14.0.r,
                      backgroundColor: HexColor('60CD6A'),

                    ),
                    SizedBox(height: 5.h,),
                    Text('Appointment',style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.bold,color: HexColor('60CD6A')),)
                  ],
                ),
                SizedBox(width:2.0.w ,),
                Padding(
                  padding:  EdgeInsets.only(bottom: 20.0.h),
                  child: Container(
                    height: 3.0.h,
                    width: 30.0.w,
                    color: Colors.grey[300],
                  ),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 14.0.r,
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 5.h,),
                    Text('Details',style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.bold,)),
                  ],
                ),
                SizedBox(width:2.0.w ,),
                Padding(
                  padding:  EdgeInsets.only(bottom: 20.0.h),
                  child: Container(
                    height: 3.0.h,
                    width: 30.0,
                    color: Colors.grey[300],
                  ),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 14.0.r,
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 5.h,),
                    Text('Cost',style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.bold,)),
                  ],
                ),
                SizedBox(width:3.0.w ,),
                Padding(
                  padding:EdgeInsets.only(bottom: 20.0.w),
                  child: Container(
                    height: 3.0.h,
                    width: 30.0.w,
                    color: Colors.grey[300],
                  ),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 14.0.r,
                      backgroundColor: Colors.grey[300],

                    ),
                    SizedBox(height: 5.h,),
                    Text('Payment',style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.bold)),
                  ],
                ),

              ],
            ),
            SizedBox(height: 40.0.h,),
            Text(
              'Select A Day',
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.bold
              ),

            ),
            SizedBox(height: 20.0.h,),
            Container(
              height: 95.0.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder:(context,index)=>
                    GestureDetector(
                      child: Container(
                        width: 60.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0.r),
                            color: i==index?Colors.blue:Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300]!,
                              spreadRadius: 3.r,
                              blurRadius: 5.r,
                              offset: Offset(0, 3),
                            ),
                            BoxShadow(
                              color: Colors.grey[300]!,
                              spreadRadius: 3.r,
                              blurRadius: 5.r,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child:Center(
                          child: Text(
                            days[index],
                            style: TextStyle(
                                color: i==index?Colors.white:Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0.sp
                            ),
                          ),
                        ),
                      ),
                      onTap: ()
                      {
                        setState(() {
                          i=index;
                        });

                      },
                    ),
                separatorBuilder:(context,index)=>SizedBox(width: 10.w),
                itemCount:7 ,
              ),
            ),
            SizedBox(height: 25.0.h,),
            Text(
              'Available times for ${day[i]}',
              style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0.sp,
                  color: Colors.grey[700]
              ) ,
            ),
            SizedBox(height: 5.0.h,),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1/0.23,
                  children: List.generate(slots.length, (index) => TimeSlot(time: slots[index])
                  )


              ),
            ),
            Row(
              children: [
                InkWell(
                  child: Container(
                    width: 80.0.w,
                    height: 45.0.h,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5.0.r)
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back_ios_outlined,size: 17.0.r,color: Colors.white),
                          SizedBox(width: 5.0.w,),
                          Text('Back',style: TextStyle(color: Colors.white,fontSize: 18.0.sp),),

                        ],


                      ),
                    ),
                  ),
                  onTap: (){ Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => AllMentorsScreen()));;},
                ),
                Spacer(),
                InkWell(
                  child: Container(
                    width: 80.0.w,
                    height: 45.0.h,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5.0.r)
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('Next',style: TextStyle(color: Colors.white,fontSize: 18.0.sp),),
                           SizedBox(width: 5.0.w,),
                           Icon(Icons.arrow_forward_ios_outlined,size: 17.0.r,color: Colors.white),
                           ],


                      ),
                    ),
                  ),
                  onTap: (){ Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => BookingDetails()));},
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}



class TimeSlot extends StatelessWidget {
  TimeSlot({Key? key,required this.time}) : super(key: key);
  late String time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 20.0.h,
        width: 20.0.w,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              spreadRadius: 3.r,
              blurRadius: 5.r,
              offset: Offset(0, 3),
            ),
            BoxShadow(
              color: Colors.grey[300]!,
              spreadRadius: 3.r,
              blurRadius: 5.r,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(child: Text(time,style: TextStyle(color: Colors.white),)),
      ),
      onTap: (){},
    );
  }
}

