import 'package:consultation_gp/modules/mentee/mentor_exploration/mentor_explore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../mentor/mentor_profile/mentor_profile.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  bool _checkboxValue1 = false;
  bool _checkboxValue2 = false;
  bool _checkboxValue3=false;
  String gender = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: 30.w),
          icon: Icon(Icons.arrow_back_ios,size: 28.0.r,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ExploreMentor()));
          },
        ),
        centerTitle: true,
        title:   Text(
          'Search',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0.sp
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30.w),
              icon: Icon(Icons.filter_list, size: 28.r,),
              onPressed: () {
                showModalBottomSheet(
                  context: context,backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.r),
                            topRight: Radius.circular(40.r),
                          )),
                      child: SingleChildScrollView(
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 3.h,
                                width: 60.w,
                                color: Colors.grey[300],


                              ),
                            ),
                            SizedBox(height: 30.h,),
                            Text(
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.sp,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                "Fields"
                            ),
                            Divider(height: 2.h,color: Colors.grey,),
                            CheckboxListTile(
                              title: Text('Checkbox 1'),
                              value: _checkboxValue1,
                              onChanged: ( value) {
                                _checkboxValue1 = value!;


                              },
                            ),
                            CheckboxListTile(
                              title: Text('Checkbox 2'),
                              value: _checkboxValue2,
                              onChanged: ( value) {
                                _checkboxValue2 = value!;

                              },
                            ),
                            CheckboxListTile(
                              title: Text('Checkbox 3'),
                              value: _checkboxValue3,
                              onChanged: ( value) {

                                _checkboxValue3 = value!;

                              },
                            ),
                            SizedBox(height: 20.h,),

                            Text(
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.sp,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                "Gender"
                            ),
                            Divider(height: 2.h,color: Colors.grey,),
                            SizedBox(
                              height : 100.h,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row (
                                      children: [
                                        Radio(
                                          activeColor: Colors.blue,
                                          focusColor: Colors.blue,
                                          value: 'Male',
                                          groupValue: gender,
                                          onChanged: (String ? value) {
                                            gender= value! ;
                                          },
                                        ),
                                        Text(
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18.sp,
                                              color: Colors.black.withOpacity(0.7),
                                            ),
                                            "Male"
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Radio(
                                          activeColor: Colors.blue,
                                          focusColor: Colors.blue,
                                          value: 'Female',
                                          groupValue: gender,
                                          onChanged: (String ? value) {
                                            gender= value! ;
                                          },
                                        ),
                                        Text(
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18.sp,
                                              color: Colors.black.withOpacity(0.7),
                                            ),
                                            "Female"
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MaterialButton(onPressed: (){
                              Navigator.pop(context);

                            },
                              minWidth: double.infinity,
                              color: Colors.blue,
                              child:Text(style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                                  "Apply"
                              ),

                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              )
          ],
      ),
      body:
      Stack(
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
            padding:  EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),

                  ),
                  alignment: AlignmentDirectional(0,0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4.r, 0.r, 4.r, 0.r),
                        child: TextFormField(
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.w,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(000000000),
                                width: 2.w,
                              ),
                              borderRadius: BorderRadius.circular(8.r),

                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(00000000),
                                width: 2.w,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            //prefixIcon: Icon(Icons.text,color: Color(0xFF57636C),),

                          ),
                          style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              fontWeight: FontWeight.normal,
                              fontSize: 14.sp,
                              color: Colors.black
                          ),
                          maxLines: null,

                        ),
                      ),

                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.r, 0.r, 8.r, 0.r),
                        child: Container(
                          child:ElevatedButton.icon(
                            onPressed: (){},
                            label: Text('Search',
                              style: TextStyle(
                                  color:Colors.blue,
                                  fontSize: 17.sp
                              ),
                            ),
                            icon: Icon(
                                Icons.search,
                                color:Colors.blue
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                Expanded(
                  child: ListView.separated(

                      itemBuilder:(context,index){
                        return InkWell(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MentorProfile(),
                          ));
                        },
                          child: Container(
                            width: 175.w,
                            padding: EdgeInsets.all(8.r),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 100.h,
                                          width:100.h,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(12.r),
                                          ),

                                        ),
                                         SizedBox(
                                          height: 10.h,
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

                                          ],
                                        ),

                                         SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on,color: Colors.grey,),
                                             SizedBox(width: 10.w,),
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


                                      ],
                                    ),


                                  ],
                                ),


                              ],
                            ),
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
          ),
        ],
      ),
    );
  }
}
