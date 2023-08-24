import 'package:consultation_gp/modules/mentee/booking_steps/appointment_cost/appointment_cost.dart';
import 'package:consultation_gp/modules/mentee/booking_steps/available_times/available_times.dart';
import 'package:consultation_gp/modules/mentee/booking_steps/payment_details/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 40.0.h,left: 30.0.w,right: 30.0.w,bottom: 40.0.h),
        child: SingleChildScrollView(
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
                        child: Icon(Icons.check_circle_outline_rounded,size: 25,color: Colors.white,),

                      ),
                      SizedBox(height: 5.h,),
                      Text('Appointment',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold,color: HexColor('60CD6A')),)
                    ],
                  ),
                  SizedBox(width:2.0.w ,),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 20.0.h),
                    child: Container(
                      height: 3.0.h,
                      width: 30.0.w,
                      color:HexColor('60CD6A'),
                    ),
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 14.0.r,
                        backgroundColor:HexColor('60CD6A'),
                      ),
                      SizedBox(height: 5.h,),
                      Text('Details',style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.bold,color: HexColor('60CD6A'))),
                    ],
                  ),
                  SizedBox(width:2.0.w,),
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
                        radius: 14.0,
                        backgroundColor: Colors.grey[300],
                      ),
                      SizedBox(height: 5.h,),
                      Text('Cost',style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.bold,)),
                    ],
                  ),
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
                      Text('Payment',style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.bold)),
                    ],
                  ),

                ],
              ),
              SizedBox(height:40.0.h),
              Text('Tell us about yourself and why youre seeking mentorship ?',
                style: TextStyle(
                    fontSize: 18.0.sp,
                  color: Colors.black
                ),
              ),
              SizedBox(height:10.0.h),
              TextFormField(
                maxLines: 5,
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return "Please tell us about yourself";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.grey[700]!
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.blue
                      )
                  ),

                ),
              ),
              SizedBox(height: 20.0.h,),
              Text('Whats your goal, and what steps do you need to take to get there?',
                style: TextStyle(
                    fontSize: 18.0.sp,
                    color: Colors.black
                ),
              ),
              SizedBox(height:10.0.h),
              TextFormField(
                maxLines: 5,
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return "Please tell us about your goal";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.grey[700]!
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.blue
                      )
                  ),
                ),
              ),
              SizedBox(height: 20.0.h,),
              Text('What specific areas do you need guidance or support in?',
                style: TextStyle(
                    fontSize: 18.0.sp,
                    color: Colors.black
                ),
              ),
              SizedBox(height:10.0),
              TextFormField(
                maxLines: 5,
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return "Please tell us about the specific areas";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.grey[700]!
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.blue
                      )
                  ),
                ),
              ),
              SizedBox(height: 20.0.h,),
              Text('What are the biggest challenges youre facing, and how can your mentor help you overcome them?',
                style: TextStyle(
                    fontSize: 18.0.sp,
                    color: Colors.black
                ),
              ),
              SizedBox(height:10.0.h),
              TextFormField(
                maxLines: 5,
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return "Please tell us about ypur biggist challenges";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.grey[700]!
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: Colors.blue
                      )
                  ),

                ),
              ),
              SizedBox(height: 20.0.h,),
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
                    onTap: (){Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => AvailableTimes()));},
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
                    onTap: (){Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => AppointmentCost()));},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
