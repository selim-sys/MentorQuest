import 'package:consultation_gp/modules/mentee/booking_steps/available_times/available_times.dart';
import 'package:consultation_gp/modules/mentee/view_mentor_profile/view_mentor_profile.dart';
import 'package:consultation_gp/modules/mentor/mentor_profile/mentor_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllMentorsScreen extends StatelessWidget {
  const AllMentorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          'Mentors List',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0.sp
          ),
        ),
        elevation: 0.0,
      ),

      body: Stack(
        children: [
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
          Padding(
            padding:  EdgeInsets.all(30.0.r),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder:(context,index)
                  {
                    return Stack(
                      children: [
                        Container(
                          width: double.infinity.w,
                          height: 200.h,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(4.0.r),
                          child: Center(
                            child: Container(
                              width: double.infinity.w,
                              height: 190.h,
                              padding: EdgeInsets.all(20.r),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 100.h,
                                        width:100.w,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(10.r),
                                        ),
                                      ),
                                      SizedBox(width: MediaQuery.of(context).size.width/25,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text(
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp,
                                                color: Colors.black,
                                              ),
                                              "Mohamed Hassanein"
                                          ),
                                          SizedBox(height: MediaQuery.of(context).size.height/100,),
                                          Text(
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp,
                                                color: Colors.grey[500],
                                              ),
                                              "Software Engineer"
                                          ),
                                          SizedBox(height: MediaQuery.of(context).size.height/200,),
                                          RatingBar(
                                            initialRating: 4,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 25.0.r,
                                            ratingWidget: RatingWidget(
                                                full: const Icon(Icons.star, color: Colors.amber),
                                                half: const Icon(
                                                  Icons.star_half,
                                                  color: Colors.amber,
                                                ),
                                                empty: const Icon(
                                                  Icons.star_outline,
                                                  color: Colors.amber,
                                                )
                                            ),
                                            ignoreGestures: true,
                                            onRatingUpdate: (double value) {  },
                                          ),
                                          SizedBox(height: MediaQuery.of(context).size.height/200,),
                                          Row(
                                            children: [
                                              Icon(Icons.location_on,color: Colors.grey,),
                                              SizedBox(width: MediaQuery.of(context).size.width/100,),

                                              Text(
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13.sp,
                                                    color: Colors.grey[500],
                                                  ),
                                                  "Paris, France"
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),


                                    ],
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height/40,),
                                  Container(
                                    width: 100.w,
                                    height: 30.h,
                                    child: MaterialButton(onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => ViewMentorProfile(),
                                      ));
                                    },
                                      color: Colors.blue,
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                        Icon(Icons.remove_red_eye_outlined,color: Colors.white,),
                                          SizedBox(width: MediaQuery.of(context).size.width/50,),
                                          Text(style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                          ),
                                          "View"
                                      )
                                    ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } ,
                  separatorBuilder:(context,index)
                  {
                    return  SizedBox(height: MediaQuery.of(context).size.height/40,);
                  } ,
                  itemCount: 5
              ),
            ),
          ),
        ],
      ),
    );
  }
}
