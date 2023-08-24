import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenteeBookings extends StatelessWidget {
  const MenteeBookings({Key? key}) : super(key: key);

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
          Padding(
            padding:  EdgeInsets.only(left: 30.0.w,right: 30.0.w,top: 40.0.h,bottom: 20.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text('Bookings',style: TextStyle(fontSize: 24.0.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),///مرلول على مرلول ميرولش
                  shrinkWrap: true,
                  itemBuilder: (context,index)=> Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[300]!,
                                spreadRadius: 3.r,
                                blurRadius: 4.r,
                                offset: Offset(0, 3),
                              ),
                              BoxShadow(
                                color: Colors.grey[300]!,
                                spreadRadius: 3.r,
                                blurRadius: 4.r,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0.r)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.all(10.0.r),
                                  child: CircleAvatar(
                                    radius: 40.0.r,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hassona',
                                      style: TextStyle(
                                          fontSize: 15.0.sp,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height/200,),
                                    Text(
                                      'Software Engineer',
                                      style: TextStyle(
                                          fontSize: 13.0.sp,
                                          color: Colors.black
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height/300,),
                                  ],
                                ),
                                SizedBox(width: 90.w,),
                                InkWell(
                                  child: CircleAvatar(
                                    radius: 15.0.r,
                                    child:Icon(Icons.chat,color: Colors.white,size: 20.0.r,),
                                  ),
                                )
                              ],
                            ),

                            Center(
                              child: Padding(
                                padding:  EdgeInsets.only(bottom: 15.0.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.date_range,
                                      size: 20.0.r,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width/150,),
                                    Text('10/2/2022',style: TextStyle(fontSize: 16.0.sp),),
                                    SizedBox(width: MediaQuery.of(context).size.width/30,),
                                    Container(
                                      width: 170.0.w,
                                      height: 30.0.h,
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(10.0.r)
                                      ),
                                      child: Center(child: Text(
                                        '09:00 AM  -  10:00AM',
                                        style: TextStyle(
                                          fontSize: 13.0.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),

                                      )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  separatorBuilder: (context,index)=>SizedBox(height: 20.0,),
                  itemCount: 3,

                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
