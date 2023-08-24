import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllMentorsScreenView extends StatelessWidget {
  const AllMentorsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( padding: EdgeInsets.only(left: 28.0.r),
          icon: Icon(Icons.menu,size: 33.0.r,),
          onPressed: () {  },
        ),
        centerTitle: true,
        title:   Text(
          'MENTORUEST',
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
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(27.5.r),

                itemBuilder:(context,index){
                  return Container(
                    width: 175.w,
                    padding: EdgeInsets.all(8.r),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Column(
                          children: [
                            Container(
                              height: 100.h,
                              width:100.w,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12.r),
                              ),

                            ),
                             SizedBox(
                              height: 10.h,
                            ),
                            MaterialButton(onPressed: (){

                            },
                              color: Colors.blueGrey,
                              ///Color(0xffxx)
                              child:Row(
                                children: [
                                  Icon(Icons.remove_red_eye_outlined,color: Colors.white,),
                                   SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                      "View"
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                "Mohamed Hassanein"
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                "calculas, Trignometry"
                            ),
                            SizedBox(height: 3.h,),
                            Row(

                              children: [
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
                                SizedBox(
                                  width:5.w ,

                                ),
                                Text(

                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                    "4.0"
                                ),
                              ],
                            ),
                             SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Icon(Icons.access_alarm,color: Colors.grey,),
                                 SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: Colors.grey,
                                    ),
                                    "Available on Mon, 18 Mar"
                                ),
                              ],
                            ),
                             SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on,color: Colors.grey,),
                                 SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: Colors.grey,
                                    ),
                                    "Paris, France"
                                ),
                              ],
                            ),
                             SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              children: [
                                Icon(Icons.monetization_on_outlined,color: Colors.grey,),
                                 SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: Colors.grey,
                                    ),
                                    " \$300 - \$500"
                                ),
                              ],
                            ),

                          ],
                        ),


                      ],
                    ),
                  );
                } ,
                separatorBuilder:(context,index){
                  return SizedBox(
                    height: 20.h,
                  );
                } ,
                itemCount: 5
            ),
          ),
        ],
      ),
    );
  }
}
