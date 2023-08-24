import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_cubit.dart';
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appointments extends StatelessWidget {
   Appointments({Key? key}) : super(key: key);
  var passwordController =TextEditingController();
  var topicController=TextEditingController();
   final formKey = GlobalKey<FormState>();


   @override
  Widget build(BuildContext context) {
    return BlocConsumer<MentorCubit,ConsultStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Appointments',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0.sp),
            ),
          ),
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                        colors: <Color>[Colors.blue, Colors.white10],
                        tileMode: TileMode.mirror))),
            ConditionalBuilder(
              condition:
                  MentorCubit.get(context).mentorDashboardModel == null ||
                      MentorCubit.get(context).mentorProfileModel == null,
              builder: (context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'loading your data...',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              fallback: (context) => SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(10.0.r),
                                        child: CircleAvatar(
                                          radius: 45.0,
                                          backgroundImage: NetworkImage(
                                            '${MentorCubit.get(context).dashboardModel!.photo}',
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${MentorCubit.get(context).dashboardModel!.name}',
                                            style: TextStyle(
                                                fontSize: 17.0.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                150,
                                          ),
                                          Text(
                                            '${MentorCubit.get(context).mentorProfileModel!.jobTitle}',
                                            style: TextStyle(
                                                fontSize: 13.0.sp,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                250,
                                          ),
                                          RatingBar(
                                            initialRating: MentorCubit.get(context).dashboardModel!.rating!.toDouble(),
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 18.0.sp,
                                            ratingWidget: RatingWidget(
                                                full: const Icon(Icons.star,
                                                    color: Colors.orange),
                                                half: const Icon(
                                                  Icons.star_half,
                                                  color: Colors.orange,
                                                ),
                                                empty: const Icon(
                                                  Icons.star_outline,
                                                  color: Colors.orange,
                                                )),
                                            ignoreGestures: true,
                                            onRatingUpdate: (double value) {},
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.r),
                                    child: Text(
                                      'Complete your profile: ${(MentorCubit.get(context).dashboardModel!.progress!*100).toInt()}%',
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 13.sp),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0.r),
                                    child: Container(
                                      height: 3.h,
                                      child: LinearProgressIndicator(
                                        backgroundColor: Colors.grey[300],
                                        color: Colors.blue,
                                        value: MentorCubit.get(context).dashboardModel!.progress!.toDouble(),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //SizedBox(height: MediaQuery.of(context).size.height/80,),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0.r),
                        child: Text(
                          'Clients List',
                          style: TextStyle(
                              fontSize: 20.0.sp, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 150,
                      ),
                      ConditionalBuilder(
                          condition: state is GetAppointmentsLoadingState,
                          builder: (context)=>Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(color: Colors.white,),
                                SizedBox(height: 20,),
                                Text('loading your data',style: TextStyle(fontSize: 16.0),),
                              ],
                            ),
                          ),
                          fallback: (context)=>ConditionalBuilder(
                            condition: MentorCubit.get(context).appointmentsModel!.data==null,
                            builder: (context)=>Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Center(child: Text('There is no clients,yet',style: TextStyle(fontSize: 16.0),)),
                            ),
                            fallback:(context)=> ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              ///مرلول على مرلول ميرولش
                              shrinkWrap: true,
                              itemBuilder: (context, index) => SizedBox(
                                height: MediaQuery.of(context).size.height / 4,
                                child: Column(
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
                                          borderRadius:
                                          BorderRadius.circular(10.0.r)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(10.0.r),
                                                child: CircleAvatar(
                                                  radius: 40.0.r,
                                                  backgroundImage: NetworkImage(MentorCubit.get(context).appointmentsModel!.data![index].mentee!.image!),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        MentorCubit.get(context).appointmentsModel!.data![index].mentee!.fname!,
                                                        style: TextStyle(
                                                            fontSize: 15.0.sp,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      SizedBox(width: 3,),
                                                      Text(
                                                        MentorCubit.get(context).appointmentsModel!.data![index].mentee!.lname!,
                                                        style: TextStyle(
                                                            fontSize: 15.0.sp,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                        200,
                                                  ),
                                                  Text(
                                                    MentorCubit.get(context).appointmentsModel!.data![index].mentee!.email!,
                                                    style: TextStyle(
                                                        fontSize: 13.0.sp,
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(
                                                    height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                        300,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.date_range,
                                                        size: 18.0.sp,
                                                        color: Colors.grey,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                            150,
                                                      ),
                                                      Text(
                                                        MentorCubit.get(context).appointmentsModel!.data![index].date!,
                                                        style: TextStyle(
                                                            fontSize: 12.0.sp),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.all(15.0.r),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 80.0.w,
                                                  height: 30.0.h,
                                                  decoration: BoxDecoration(
                                                      color: Colors.orange,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10.0.r)),
                                                  child: Center(
                                                      child: Text(
                                                        MentorCubit.get(context).appointmentsModel!.data![index].startTime!,
                                                        style: TextStyle(
                                                          fontSize: 13.0.sp,
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      )),
                                                ),
                                                Spacer(),
                                                Container(
                                                    width: 140.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10.0.r)),
                                                    child:  ElevatedButton(
                                                      onPressed: ()
                                                      {
                                                        showDialog(context: context, builder: (context)=>AlertDialog(
                                                          actions: [
                                                            Container(
                                                                width: 130.0,
                                                                height: 40.0,

                                                                child:  Center(
                                                                    child: ElevatedButton.icon(
                                                                      onPressed: ()
                                                                      {
                                                                        if(formKey.currentState!.validate())
                                                                        {
                                                                          MentorCubit.get(context).createMeeting(
                                                                              sessionTopic: topicController.text.trim(),
                                                                              sessionPassword: passwordController.text.trim(),
                                                                              index: index);
                                                                        }

                                                                      },
                                                                      icon: Icon(Icons.create_sharp),
                                                                      label: Text('Create',
                                                                        style: TextStyle(
                                                                            fontSize: 15.0
                                                                        ),),
                                                                      style: ElevatedButton.styleFrom(
                                                                        primary:Colors.green,
                                                                      ),
                                                                    )
                                                                )
                                                            ),
                                                          ],
                                                          content: Container(
                                                            height: 270,
                                                            width: 150,
                                                            padding: EdgeInsets.all(10),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(20.0),
                                                              child: Form(
                                                                key: formKey,
                                                                child: SingleChildScrollView(
                                                                  child: Column(
                                                                    children: [
                                                                      Text(
                                                                          style: TextStyle(
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 19,
                                                                            color: Colors.black,
                                                                          ),
                                                                          "Topic: "),
                                                                      SizedBox(
                                                                        height: 5,
                                                                      ),
                                                                      TextFormField(
                                                                        validator: (value) {
                                                                          if(value == null||value.isEmpty)
                                                                          {
                                                                            return "Please enter session's topic";
                                                                          }
                                                                          return null;
                                                                        },
                                                                        controller: topicController,

                                                                        decoration: InputDecoration(
                                                                          enabledBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(10),
                                                                            borderSide: BorderSide(
                                                                              color: Colors.blue,
                                                                            ),
                                                                          ),
                                                                          focusedBorder: OutlineInputBorder(),
                                                                        ),
                                                                      ),
                                                                      SizedBox(height: 20.0,),
                                                                      Text(
                                                                          style: TextStyle(
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 19,
                                                                            color: Colors.black,
                                                                          ),
                                                                          "Password: "),
                                                                      SizedBox(
                                                                        height: 5,
                                                                      ),
                                                                      TextFormField(
                                                                        validator: (value) {
                                                                          if(value == null||value.isEmpty)
                                                                          {
                                                                            return "Please enter session's password";
                                                                          }
                                                                          return null;
                                                                        },
                                                                        controller: passwordController,

                                                                        decoration: InputDecoration(
                                                                          enabledBorder: OutlineInputBorder(
                                                                            borderRadius: BorderRadius.circular(10),
                                                                            borderSide: BorderSide(
                                                                              color: Colors.blue,
                                                                            ),
                                                                          ),
                                                                          focusedBorder: OutlineInputBorder(),
                                                                        ),
                                                                      ),




                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ));
                                                      }, child: Text('Create meeting',
                                                      style: TextStyle(
                                                          fontSize: 15.0
                                                      ),),
                                                      style: ElevatedButton.styleFrom(
                                                          primary: Colors.green,
                                                          elevation: 0.0,
                                                      )
                                                    )
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 20.0.h,
                              ),
                              itemCount: MentorCubit.get(context).appointmentsModel!.data!.length,
                            )
                          )
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
