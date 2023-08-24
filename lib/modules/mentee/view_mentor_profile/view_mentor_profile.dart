import 'package:consultation_gp/modules/login/login_screen/login.dart';
import 'package:consultation_gp/modules/mentee/booking_steps/available_times/available_times.dart';
import 'package:consultation_gp/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewMentorProfile extends StatelessWidget {
  const ViewMentorProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0.sp
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 25.0.w),
            child: TextButton(

                onPressed: ()
                {
                  CacheHelper.sharedPreferences.remove('token').then((value) =>
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ConsultLogin()), (route) => false));
                },
                child: Text('Log out',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0.sp
                  ),
                )
            ),
          )
        ],
        elevation: 0.0,
      ),
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
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 20.h),
                    child: Container(
                      height: 215.0.h,
                      decoration: BoxDecoration(
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
                                  radius: 45.0.r,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Mahmoud Amin',
                                    style: TextStyle(
                                        fontSize: 20.0.sp,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 3.h,),
                                  Text(
                                    'Software Engineer',
                                    style: TextStyle(
                                        fontSize: 15.0.sp,
                                        color: Colors.black
                                    ),
                                  ),
                                  SizedBox(height: 3,),
                                  RatingBar(
                                    initialRating: 0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 25.0,
                                    ratingWidget: RatingWidget(
                                        full: const Icon(Icons.star, color: Colors.orange),
                                        half: const Icon(
                                          Icons.star_half,
                                          color: Colors.orange,
                                        ),
                                        empty: const Icon(
                                          Icons.star_outline,
                                          color: Colors.orange,
                                        )
                                    ),
                                    ignoreGestures: true,
                                    onRatingUpdate: (double value) {  },
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10.0.h,),
                          Padding(
                            padding:  EdgeInsets.only(right:12.0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Chat Me',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0.sp),),
                                SizedBox(width: 8.0.w,),
                                InkWell(
                                  child: CircleAvatar(
                                    radius: 15.0.r,
                                  child:Icon(Icons.chat,color: Colors.white,size: 20.0.r,),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0.h,),
                          Padding(
                            padding:  EdgeInsets.only(left: 12.w),
                            child: Text(
                              'Complete your profile: 60%',
                              style: TextStyle(
                                  color: Colors.grey[500]
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.all(12.0.r),
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey[300],
                              color: Colors.blue,
                              value: 0.6,
                              minHeight: 5.5,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    //height: 650.0.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10.0.r)
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(top:8.0.h, right: 5.0.w, left: 5.0.w, bottom: 5.0.h ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Plans',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0.sp
                            ),
                          ),
                          SizedBox(height: 10.h,),
                          Padding(
                            padding:  EdgeInsets.all(5.0.r),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 300.w,
                                    height: 450.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20.0.r)

                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 16.0.r),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                textAlign: TextAlign.center,
                                                '\$240',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 35.0.sp,
                                                    color: HexColor('41a980')
                                                ),
                                              ),
                                              SizedBox(width: 8.w,),
                                              Text(
                                                textAlign: TextAlign.end,
                                                '/month',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.0.sp
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30.h,),
                                          Text(
                                            'Standard Plan',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25.0.sp
                                            ),
                                          ),
                                          SizedBox(height: 10.h,),
                                          Text(
                                              style: TextStyle(
                                                  fontSize: 20.sp
                                              ),
                                              "Keep me on retainer as we meet sporadically, as your schedule allows it."),
                                          Padding(
                                            padding:  EdgeInsets.symmetric(vertical: 16.0.h),
                                            child: Container(
                                              height: 1.0.h,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300]
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Stack(
                                                children: [
                                                  Icon(Icons.circle,size: 33.0.r,color: HexColor('e1f4ed'),),
                                                  Padding(
                                                    padding:  EdgeInsets.all(2.0.r),
                                                    child: Icon(Icons.check,color: HexColor('7cb69e'),size: 27.0.r,),
                                                  ),

                                                ],
                                              ),
                                              SizedBox(width:16 .w,),
                                              Column(
                                                children: [
                                                  Text('2 Sessions per month',style: TextStyle(fontSize: 16.0.sp,fontWeight: FontWeight.bold),),
                                                  Text('Every session will be 1 hour',style: TextStyle(fontSize: 12.0.sp,fontWeight: FontWeight.w500, color: Colors.grey),),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.0.h,),
                                          Row(
                                            children: [
                                              Stack(
                                                children: [
                                                  Icon(Icons.circle,size: 33.0.r,color: HexColor('e1f4ed'),),
                                                  Padding(
                                                    padding:  EdgeInsets.all(2.0.r),
                                                    child: Icon(Icons.check,color: HexColor('7cb69e'),size: 27.0.r,),
                                                  ),

                                                ],
                                              ),
                                              SizedBox(width:16.w ,),
                                              Text('Unlimited Q&A chat',style: TextStyle(fontSize: 16.0.sp,fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                          SizedBox(height: 10.0.h,),
                                          Row(
                                            children: [
                                              Stack(
                                                children: [
                                                  Icon(Icons.circle,size: 33.0.r,color: HexColor('e1f4ed'),),
                                                  Padding(
                                                    padding:  EdgeInsets.all(2.0.r),
                                                    child: Icon(Icons.check,color: HexColor('7cb69e'),size: 27.0.r,),
                                                  ),

                                                ],
                                              ),
                                              SizedBox(width:16.w ,),
                                              Text('Response time in 24 hours',style: TextStyle(fontSize: 16.0.sp,fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                          SizedBox(height: 30.h,),
                                          Container(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                  onPressed: (){Navigator.pushReplacement(context,
                                                      MaterialPageRoute(builder: (context) => AvailableTimes()));;},
                                                  child: Text('Apply',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0.sp),)))
                                        ],
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(),
                                  Container(
                                    width: 300.w,
                                    height: 450.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20.0.r)

                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.all(16.0.r),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                textAlign: TextAlign.center,
                                                '\$450',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 35.0.sp,
                                                    color: HexColor('41a980')
                                                ),
                                              ),
                                              SizedBox(width: 8.w,),
                                              Text(
                                                textAlign: TextAlign.end,
                                                '/month',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.0.sp
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30.h,),
                                          Text(
                                            'ProPlan',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25.0.sp
                                            ),
                                          ),
                                          SizedBox(height: 10.h,),
                                          Text(
                                              style: TextStyle(
                                                  fontSize: 20.sp
                                              ),
                                              "Keep me on retainer as we meet sporadically, as your schedule allows it."),
                                          Padding(
                                            padding:  EdgeInsets.symmetric(vertical: 16.0.h),
                                            child: Container(
                                              height: 1.0.h,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300]
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Stack(
                                                children: [
                                                  Icon(Icons.circle,size: 33.0.r,color: HexColor('e1f4ed'),),
                                                  Padding(
                                                    padding:  EdgeInsets.all(2.0.r),
                                                    child: Icon(Icons.check,color: HexColor('7cb69e'),size: 27.0.r,),
                                                  ),

                                                ],
                                              ),
                                              SizedBox(width:16.w ,),
                                              Column(
                                                children: [
                                                  Text('4 Sessions per month',style: TextStyle(fontSize: 16.0.sp,fontWeight: FontWeight.bold),),
                                                  Text('Every session will be 1 hour ',style: TextStyle(fontSize: 12.0.sp,fontWeight: FontWeight.w500, color: Colors.grey),),
                                                ],
                                              ),],
                                          ),
                                          SizedBox(height: 10.0.h,),
                                          Row(
                                            children: [
                                              Stack(
                                                children: [
                                                  Icon(Icons.circle,size: 33.0.r,color: HexColor('e1f4ed'),),
                                                  Padding(
                                                    padding:  EdgeInsets.all(2.0.r),
                                                    child: Icon(Icons.check,color: HexColor('7cb69e'),size: 27.0.r,),
                                                  ),

                                                ],
                                              ),
                                              SizedBox(width:16.w ,),
                                              Text('Unlimited Q&A chat',style: TextStyle(fontSize: 16.0.sp,fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                          SizedBox(height: 10.0.h,),
                                          Row(
                                            children: [
                                              Stack(
                                                children: [
                                                  Icon(Icons.circle,size: 33.0.r,color: HexColor('e1f4ed'),),
                                                  Padding(
                                                    padding:  EdgeInsets.all(2.0.r),
                                                    child: Icon(Icons.check,color: HexColor('7cb69e'),size: 27.0.r,),
                                                  ),

                                                ],
                                              ),
                                              SizedBox(width:16.w ,),
                                              Text('Response time in 12 hours',style: TextStyle(fontSize: 16.0.sp,fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                          SizedBox(height: 30.h,),
                                          Container(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                  onPressed: (){Navigator.pushReplacement(context,
                                                      MaterialPageRoute(builder: (context) => AvailableTimes()));;},
                                                  child: Text('Apply',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0.sp),)))
                                        ],
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(),
                                  Container(
                                    width: 300.w,
                                    height: 450.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20.0.r)

                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.all(16.0.r),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                textAlign: TextAlign.center,
                                                '\$200',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 35.0.sp,
                                                    color: HexColor('41a980')
                                                ),
                                              ),
                                              SizedBox(width: 8.w,),
                                              Text(
                                                textAlign: TextAlign.end,
                                                '/month',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.0.sp
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30.h,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Per Session Plan',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25.0.sp
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.h,),
                                          Text(
                                              style: TextStyle(
                                                  fontSize: 20.sp
                                              ),
                                              "Keep me on retainer as we meet sporadically, as your schedule allows it."),

                                          SizedBox(height: 25.h,),
                                          Container(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                  onPressed: (){Navigator.pushReplacement(context,
                                                      MaterialPageRoute(builder: (context) => AvailableTimes()));;},
                                                  child: Text('Apply',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0.sp),)))

                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )


                        ],
                      ),
                    ),

                  ),
                  SizedBox(height: 20.0.h,),
                  Stack(
                    children: [
                      Container(
                        height: 155.0.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0.r)
                        ),
                      ),
                      Container(
                        height: 150.0.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0.r)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(8.0.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('About Me',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23.0.sp
                                ),
                              ),
                              SizedBox(height: 7.0.h,),
                              Text(' I am a software engineer  I am a software engineer  I am a software engineer  I am a software engineer  I am a software engineer  I am a software engineer  I am a software engineer  I am a software engineer  ',
                                maxLines: 5,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.0.sp,
                                ),

                              )
                            ],
                          ),
                        ),

                      ),
                    ],
                  ),
                  SizedBox(height: 20.0.h,),
                  Stack(
                    children: [
                      Container(
                        height: 175.0.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0.r)
                        ),
                      ),
                      Container(
                        height: 170.0.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0.r)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(8.0.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Personal Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23.0.sp
                                ),
                              ),
                              SizedBox(height: 10.0.h,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22.0.r,
                                    backgroundColor: HexColor('#a7d5fe'),
                                    child:Icon(
                                      Icons.person_outline_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20.0.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Gender',
                                        style: TextStyle(
                                            fontSize: 20.0.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 3.0.h,),
                                      Text('Male',
                                        style: TextStyle(
                                          fontSize: 17.0.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10.0.h,),
                              Container(
                                height: 1.0.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                ),
                              ),
                              SizedBox(height: 10.0.h,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22.0.r,
                                    backgroundColor: HexColor('#a0aaff'),
                                    child:Icon(
                                      Icons.calendar_today_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20.0.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Date Of birth',
                                        style: TextStyle(
                                            fontSize: 20.0.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 3.0.h,),
                                      Text('01-02-2000',
                                        style: TextStyle(
                                          fontSize: 17.0.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),


                            ],
                          ),
                        ),

                      ),
                    ],
                  ),
                  SizedBox(height: 20.0.h,),
                  Stack(
                    children: [
                      Container(
                        height: 155.0.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0.r)
                        ),
                      ),
                      Container(
                        height: 150.0.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0.r)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(8.0.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Skills',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23.0.sp
                                ),
                              ),
                              SizedBox(height: 7.0.h,),
                              Text('Flutter , Dart , PHP , Larvel , Angular , Sql , MySql , Firebase , APIs , Flutter , Dart , PHP , Larvel , Angular , Sql , MySql , Firebase , APIs ,  Flutter , Dart , PHP , Larvel , Angular , Sql ',
                                maxLines: 4,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.0.sp,
                                ),

                              )
                            ],
                          ),
                        ),

                      ),
                    ],
                  ),
                  SizedBox(height: 20.0.h,),
                  Stack(
                    children: [
                      Container(
                        height: 245.0.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0.r)
                        ),
                      ),
                      Container(
                        height: 240.0.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0.r)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(8.0.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Qualification',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23.0.sp
                                ),
                              ),
                              SizedBox(height: 10.0.h,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22.0.r,
                                    backgroundColor: HexColor('#e77751'),
                                    child:Icon(
                                      Icons.maps_home_work_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20.0.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Company',
                                        style: TextStyle(
                                            fontSize: 20.0.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 3.0.h,),
                                      Text('Eraasoft',
                                        style: TextStyle(
                                          fontSize: 17.0.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10.0.h,),
                              Container(
                                height: 1.0.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                ),
                              ),
                              SizedBox(height: 10.0.h,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22.0.r,
                                    backgroundColor: HexColor('#fbcd14'),
                                    child:Icon(
                                      Icons.star_outline_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20.0.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Experience',
                                        style: TextStyle(
                                            fontSize: 20.0.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 3.0.h,),
                                      Text('Senior',
                                        style: TextStyle(
                                          fontSize: 17.0.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10.0.h,),
                              Container(
                                height: 1.0.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                ),
                              ),
                              SizedBox(height: 10.0.h,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22.0.r,
                                    backgroundColor: HexColor('#e0a144'),
                                    child:Icon(
                                      Icons.numbers_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20.0.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Years Of Experience',
                                        style: TextStyle(
                                            fontSize: 20.0.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 3.0.h,),
                                      Text('6 years in Software Engineering',
                                        style: TextStyle(
                                          fontSize: 17.0.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),


                            ],
                          ),
                        ),

                      ),
                    ],
                  ),
                  SizedBox(height: 20.0.h,),
                  Stack(
                    children: [
                      Container(
                        height: 310.0.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0.r)
                        ),
                      ),
                      Container(
                        height: 305.0.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0.r)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(8.0.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Location',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23.0
                                ),
                              ),
                              SizedBox(height: 10.0.h,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22.0.r,
                                    backgroundColor: HexColor('#8660d2'),
                                    child:Icon(
                                      Icons.flag,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20.0.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Country',
                                        style: TextStyle(
                                            fontSize: 20.0.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 3.0.h,),
                                      Text('Egypt',
                                        style: TextStyle(
                                          fontSize: 17.0.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10.0.h,),
                              Container(
                                height: 1.0.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                ),
                              ),
                              SizedBox(height: 10.0.h,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22.0.r,
                                    backgroundColor: HexColor('#ff9cab'),
                                    child:Icon(
                                      Icons.location_city_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20.0.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('City',
                                        style: TextStyle(
                                            fontSize: 20.0.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 3.0.h,),
                                      Text('Cairo',
                                        style: TextStyle(
                                          fontSize: 17.0.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10.0.h,),
                              Container(
                                height: 1.0.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                ),
                              ),
                              SizedBox(height: 10.0.h,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22.0.r,
                                    backgroundColor: HexColor('#a8b7cd'),
                                    child:Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20.0.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Address',
                                        style: TextStyle(
                                            fontSize: 20.0.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 3.0.h,),
                                      Text('5-Ahmed Oraby street',
                                        style: TextStyle(
                                          fontSize: 17.0.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10.0.h,),
                              Container(
                                height: 1.0.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300]
                                ),
                              ),
                              SizedBox(height: 10.0.h,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22.0.r,
                                    backgroundColor: HexColor('#326172'),
                                    child:Icon(
                                      Icons.markunread_mailbox_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 20.0.w,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Zip Code',
                                        style: TextStyle(
                                            fontSize: 20.0.sp,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(height: 3.0.h,),
                                      Text('641001',
                                        style: TextStyle(
                                          fontSize: 17.0.sp,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),


                            ],
                          ),
                        ),

                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),



                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}