import 'package:consultation_gp/modules/mentee/booking_steps/available_times/available_times.dart';
import 'package:consultation_gp/modules/mentee/booking_steps/booking_details/booking_details.dart';
import 'package:consultation_gp/modules/mentee/booking_steps/payment_details/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentCost extends StatelessWidget {
  const AppointmentCost({Key? key}) : super(key: key);

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
                      child: Icon(Icons.check_circle_outline_rounded,size: 25.r,color: Colors.white,),

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
                    color:HexColor('60CD6A'),
                  ),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 14.0.r,
                      backgroundColor:HexColor('60CD6A'),
                      child: Icon(Icons.check_circle_outline_rounded,size: 25.r,color: Colors.white,),
                    ),
                    SizedBox(height: 5.h,),
                    Text('Details',style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.bold,color: HexColor('60CD6A'))),
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
                SizedBox(width:3.0.w ,),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 14.0.r,
                      backgroundColor:HexColor('60CD6A'),
                    ),
                    SizedBox(height: 5.h,),
                    Text('Cost',style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.bold,color: HexColor('60CD6A'))),
                  ],
                ),
                SizedBox(width:3.0.w ,),
                Padding(
                  padding:  EdgeInsets.only(bottom: 20.0.w),
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
            Text('Booking Summery',
              style: TextStyle(
                  fontSize: 18.0.sp,
                  color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0.h,),
            costInfoItem(title: 'Date', value: '15 may 2023'),
            costInfoItem(title: 'Time', value: '10:00 Am'),
            costInfoItem(title: 'Consulting Fee', value: '\$80'),
            Divider(height: 1.5.h, color: Colors.grey,),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 20.0.h),
              child:   Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',
                    style: TextStyle(
                        fontSize: 22.0.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('80\$',
                    style: TextStyle(
                        fontSize: 22.0.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),
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
                      MaterialPageRoute(builder: (context) => BookingDetails()));},
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
                          Text('Pay',style: TextStyle(color: Colors.white,fontSize: 18.0.sp),),
                          SizedBox(width: 5.0.w,),
                          Icon(Icons.arrow_forward_ios_outlined,size: 17.0.r,color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  onTap: (){Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PaymentDetails()));},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


Widget costInfoItem({required String title, required String value})=>Padding(
  padding:  EdgeInsets.symmetric(vertical: 10.0.h),
  child:   Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,
        style: TextStyle(
            fontSize: 17.0.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500
        ),
      ),
      Text(value,
        style: TextStyle(
            fontSize: 17.0.sp,
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.w400
        ),
      ),
    ],
  ),
);