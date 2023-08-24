
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_cubit.dart';
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_states.dart';
import 'package:consultation_gp/modules/login/login_screen/login.dart';
import 'package:consultation_gp/modules/mentee/booking_steps/available_times/available_times.dart';
import 'package:consultation_gp/modules/mentor/create_plan/standard_plan.dart';
import 'package:consultation_gp/modules/mentor/reviews/view_reviews.dart';
import 'package:consultation_gp/modules/mentor/schedule_timings/schedule_time.dart';
import 'package:consultation_gp/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MentorProfile extends StatelessWidget {
  const MentorProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //MentorCubit.get(context).getSavedProfileData();
    return BlocConsumer<MentorCubit,ConsultStates>(
      listener: (context,state){},
      builder: (context,state) {
        MentorCubit cubit= MentorCubit.get(context);
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
            ConditionalBuilder(
              condition: state is GetProfileDataLoadingState||MentorCubit.get(context).mentorProfileModel==null||MentorCubit.get(context).dashboardModel==null,
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
              fallback: (context)=> SafeArea(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            height: 170.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CircleAvatar(
                                        radius: 45.0,
                                        backgroundImage: NetworkImage(
                                          '${MentorCubit.get(context).dashboardModel!.photo}',
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '${MentorCubit.get(context).dashboardModel!.name}',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 3,),
                                        Text(
                                          '${MentorCubit.get(context).mentorProfileModel!.jobTitle}',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black
                                          ),
                                        ),
                                        SizedBox(height: 3,),
                                        RatingBar(
                                          initialRating: MentorCubit.get(context).dashboardModel!.rating!.toDouble(),
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
                                SizedBox(height: 10.0,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Text(
                                    'Complete your profile: ${(MentorCubit.get(context).dashboardModel!.progress!*100).toInt()}%',
                                    style: TextStyle(
                                        color: Colors.grey[500]
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: LinearProgressIndicator(
                                    backgroundColor: Colors.grey[300],
                                    color: Colors.blue,
                                    value: MentorCubit.get(context).dashboardModel!.progress!.toDouble(),
                                    minHeight: 5.5,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 480.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Plans',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23.0
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                ConditionalBuilder(
                                    condition: state is GetPlansLoadingState,
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
                                    fallback: (context)=> ConditionalBuilder(
                                        condition: MentorCubit.get(context).plansModel!.data==null,
                                        builder: (context)=>Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Text('Create your plan',style: TextStyle(fontSize: 16.0),),
                                                SizedBox(height: 40.0,),
                                                Container(
                                                    width: 150.0,
                                                    child:  ElevatedButton.icon(
                                                      onPressed: ()
                                                      {
                                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>StandardPlan()));
                                                      },
                                                      icon: Icon(Icons.remove_red_eye_rounded),
                                                      label: Text('Create Plan',
                                                        style: TextStyle(
                                                            fontSize: 15.0
                                                        ),),
                                                      style: ElevatedButton.styleFrom(
                                                          primary: Colors.blue,
                                                      ),
                                                    )
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                        fallback: (context)=>Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  width: 310,
                                                  height: 400,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(20.0)

                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(16.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              textAlign: TextAlign.center,
                                                              '\$${MentorCubit.get(context).plansModel!.data!.standard!.price}',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 35.0,
                                                                  color: HexColor('41a980')
                                                              ),
                                                            ),
                                                            SizedBox(width: 8,),
                                                            Text(
                                                              textAlign: TextAlign.end,
                                                              '/month',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 15.0
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 30,),
                                                        Text(
                                                          'Standard Plan',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 25.0
                                                          ),
                                                        ),
                                                        SizedBox(height: 10,),
                                                        Text(
                                                            style: TextStyle(
                                                                fontSize: 20
                                                            ),
                                                            "${MentorCubit.get(context).plansModel!.data!.standard!.description}"),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                                                          child: Container(
                                                            height: 1.0,
                                                            decoration: BoxDecoration(
                                                                color: Colors.grey[300]
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Icon(Icons.circle,size: 33.0,color: HexColor('e1f4ed'),),
                                                                Padding(
                                                                  padding: const EdgeInsets.all(2.0),
                                                                  child: Icon(Icons.check,color: HexColor('7cb69e'),size: 27.0,),
                                                                ),

                                                              ],
                                                            ),
                                                            SizedBox(width:16 ,),
                                                            Column(
                                                              children: [
                                                                Text('${MentorCubit.get(context).plansModel!.data!.standard!.noSessions} Sessions per month',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                                                                Text('Every session will be  40 minutes',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w500, color: Colors.grey),),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 10.0,),
                                                        Row(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Icon(Icons.circle,size: 33.0,color: HexColor('e1f4ed'),),
                                                                Padding(
                                                                  padding: const EdgeInsets.all(2.0),
                                                                  child: Icon(Icons.check,color: HexColor('7cb69e'),size: 27.0,),
                                                                ),

                                                              ],
                                                            ),
                                                            SizedBox(width:16.0,),
                                                            MentorCubit.get(context).plansModel!.data!.standard!.chat !=null?
                                                            Text('Unlimited Q&A chat',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),):
                                                            SizedBox(height: 1.0,),
                                                          ],
                                                        ),
                                                        SizedBox(height: 10.0,),
                                                        Row(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Icon(Icons.circle,size: 33.0,color: HexColor('e1f4ed'),),
                                                                Padding(
                                                                  padding: const EdgeInsets.all(2.0),
                                                                  child: Icon(Icons.check,color: HexColor('7cb69e'),size: 27.0,),
                                                                ),

                                                              ],
                                                            ),
                                                            SizedBox(width:16 ,),
                                                            Text('Response time ${MentorCubit.get(context).plansModel!.data!.standard!.responseTime}',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                                                          ],
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                VerticalDivider(),
                                                Container(
                                                  width: 310,
                                                  height: 400,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(20.0)

                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(16.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              textAlign: TextAlign.center,
                                                              '\$${MentorCubit.get(context).plansModel!.data!.pro!.price}',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 35.0,
                                                                  color: HexColor('41a980')
                                                              ),
                                                            ),
                                                            SizedBox(width: 8,),
                                                            Text(
                                                              textAlign: TextAlign.end,
                                                              '/month',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 15.0
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 30,),
                                                        Text(
                                                          'ProPlan',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 25.0
                                                          ),
                                                        ),
                                                        SizedBox(height: 10,),
                                                        Text(
                                                            style: TextStyle(
                                                                fontSize: 20
                                                            ),
                                                            "${MentorCubit.get(context).plansModel!.data!.pro!.description}"),
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                                                          child: Container(
                                                            height: 1.0,
                                                            decoration: BoxDecoration(
                                                                color: Colors.grey[300]
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Icon(Icons.circle,size: 33.0,color: HexColor('e1f4ed'),),
                                                                Padding(
                                                                  padding: const EdgeInsets.all(2.0),
                                                                  child: Icon(Icons.check,color: HexColor('7cb69e'),size: 27.0,),
                                                                ),

                                                              ],
                                                            ),
                                                            SizedBox(width:16 ,),
                                                            Column(
                                                              children: [
                                                                Text('${MentorCubit.get(context).plansModel!.data!.pro!.noSessions} Sessions per month',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                                                                Text('Every session will be 40 monutes',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w500, color: Colors.grey),),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 10.0,),
                                                        Row(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Icon(Icons.circle,size: 33.0,color: HexColor('e1f4ed'),),
                                                                Padding(
                                                                  padding: const EdgeInsets.all(2.0),
                                                                  child: Icon(Icons.check,color: HexColor('7cb69e'),size: 27.0,),
                                                                ),

                                                              ],
                                                            ),
                                                            SizedBox(width:16 ,),
                                                            MentorCubit.get(context).plansModel!.data!.standard!.chat !=null?
                                                            Text('Unlimited Q&A chat',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),):
                                                            SizedBox(height: 1.0,),                                                          ],
                                                        ),
                                                        SizedBox(height: 10.0,),
                                                        Row(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                Icon(Icons.circle,size: 33.0,color: HexColor('e1f4ed'),),
                                                                Padding(
                                                                  padding: const EdgeInsets.all(2.0),
                                                                  child: Icon(Icons.check,color: HexColor('7cb69e'),size: 27.0,),
                                                                ),

                                                              ],
                                                            ),
                                                            SizedBox(width:16 ,),
                                                            Text('Response time ${MentorCubit.get(context).plansModel!.data!.pro!.responseTime}',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                                                          ],
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                VerticalDivider(),
                                                Container(
                                                  width: 310,
                                                  height: 400,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(20.0)

                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(16.0),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              textAlign: TextAlign.center,
                                                              '\$${MentorCubit.get(context).plansModel!.data!.perSession!.price}',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 35.0,
                                                                  color: HexColor('41a980')
                                                              ),
                                                            ),
                                                            SizedBox(width: 8,),
                                                            Text(
                                                              textAlign: TextAlign.end,
                                                              '/session',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 15.0
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 30,),

                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              'Per Session Plan',
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 25.0
                                                              ),
                                                            ),
                                                            Text('Every session will be 40 minutes',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.w500, color: Colors.grey),),
                                                          ],
                                                        ),
                                                        SizedBox(height: 10,),
                                                        Text(
                                                            style: TextStyle(
                                                                fontSize: 20
                                                            ),
                                                            "${MentorCubit.get(context).plansModel!.data!.perSession!.description}"),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        )
                                )



                              ],
                            ),
                          ),

                        ),
                        SizedBox(height: 20.0,),
                        Container(
                          height: 300.0,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: ConditionalBuilder(
                              condition: state is GetReviewsLoadingState,
                              builder: (context)=>Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Reviews',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23.0
                                          ),
                                        ),
                                        ElevatedButton.icon(
                                            label: Text("View all"),
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => Reviews()));
                                            },
                                            icon: Icon(Icons.remove_red_eye_rounded)
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Center(child: CircularProgressIndicator(color: Colors.white,)),
                                    SizedBox(height: 20,),
                                    Text('loading your data',style: TextStyle(fontSize: 16.0),),
                                  ],
                                ),
                              ),
                              fallback: (context)=>ConditionalBuilder(
                                  condition: MentorCubit.get(context).reviewsModel!.data==null,
                                  builder: (context)=>Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Text('Reviews',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23.0
                                          ),
                                        ),
                                        Center(child: Text('There is no data,yet',style: TextStyle(fontSize: 16.0),)),
                                      ],
                                    ),
                                  ),
                                  fallback: (context)=>Container(
                                    height: 300.0,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Reviews',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 23.0
                                                ),
                                              ),
                                              ElevatedButton.icon(
                                                  label: Text("View all"),
                                                  onPressed: ()
                                                  {
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                        builder: (context) => Reviews()));
                                                   // MentorCubit.get(context).getReviews();
                                                  },
                                                  icon: Icon(Icons.remove_red_eye_rounded)
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Container(
                                            height: 195,
                                            child: ListView.separated(
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                itemBuilder: (context,index)=>ReviewItem(
                                                    menteePhoto: MentorCubit.get(context).reviewsModel!.data![index].mentee!.image!,
                                                    menteeFname: MentorCubit.get(context).reviewsModel!.data![index].mentee!.fname!,
                                                    menteeLname: MentorCubit.get(context).reviewsModel!.data![index].mentee!.lname!,
                                                    date: '4days ago',
                                                    content: MentorCubit.get(context).reviewsModel!.data![index].reviewText!
                                                ),
                                                separatorBuilder: (context,index)=>SizedBox(width: 20.0,),
                                                itemCount: 4
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                              )
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        Stack(
                          children: [
                            Container(
                              height: 155.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                            ),
                            Container(
                              height: 150.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('About Me',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23.0
                                      ),
                                    ),
                                    SizedBox(height: 7.0,),
                                    Text(cubit.mentorProfileModel!.bio!,
                                      maxLines: 5,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17.0,
                                      ),

                                    )
                                  ],
                                ),
                              ),

                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Stack(
                          children: [
                            Container(
                              height: 175.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                            ),
                            Container(
                              height: 170.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Personal Details',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23.0
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 22.0,
                                          backgroundColor: HexColor('#a7d5fe'),
                                          child:Icon(
                                            Icons.person_outline_rounded,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 20.0,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Gender',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(height: 3.0,),
                                            Text(cubit.mentorProfileModel!.gender!,
                                              style: TextStyle(
                                                fontSize: 17.0,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.0,),
                                    Container(
                                      height: 1.0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300]
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 22.0,
                                          backgroundColor: HexColor('#a0aaff'),
                                          child:Icon(
                                            Icons.calendar_today_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 20.0,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Date Of birth',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(height: 3.0,),
                                            Text(cubit.mentorProfileModel!.birthDate!,
                                              style: TextStyle(
                                                fontSize: 17.0,
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
                        Stack(
                          children: [
                            Container(
                              height: 155.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                            ),
                            Container(
                              height: 150.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Skills',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23.0
                                      ),
                                    ),
                                    SizedBox(height: 7.0,),
                                    Text( cubit.mentorProfileModel!.skills!,
                                      maxLines: 4,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17.0,
                                      ),

                                    )
                                  ],
                                ),
                              ),

                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Stack(
                          children: [
                            Container(
                              height: 245.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                            ),
                            Container(
                              height: 240.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Qualification',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23.0
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 22.0,
                                          backgroundColor: HexColor('#e77751'),
                                          child:Icon(
                                            Icons.maps_home_work_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 20.0,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Company',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(height: 3.0,),
                                            Text(cubit.mentorProfileModel!.company!,
                                              style: TextStyle(
                                                fontSize: 17.0,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.0,),
                                    Container(
                                      height: 1.0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300]
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 22.0,
                                          backgroundColor: HexColor('#fbcd14'),
                                          child:Icon(
                                            Icons.star_outline_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 20.0,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Experience',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(height: 3.0,),
                                            Text(cubit.mentorProfileModel!.experience!,
                                              style: TextStyle(
                                                fontSize: 17.0,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.0,),
                                    Container(
                                      height: 1.0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300]
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 22.0,
                                          backgroundColor: HexColor('#e0a144'),
                                          child:Icon(
                                            Icons.numbers_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 20.0,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Years Of Experience',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(height: 3.0,),
                                            Text('${cubit.mentorProfileModel!.yearsOfExperience!} years',
                                              style: TextStyle(
                                                fontSize: 17.0,
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
                        Stack(
                          children: [
                            Container(
                              height: 310.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                            ),
                            Container(
                              height: 305.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Location',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23.0
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 22.0,
                                          backgroundColor: HexColor('#8660d2'),
                                          child:Icon(
                                            Icons.flag,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 20.0,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Country',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(height: 3.0,),
                                            Text(cubit.mentorProfileModel!.country!,
                                              style: TextStyle(
                                                fontSize: 17.0,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.0,),
                                    Container(
                                      height: 1.0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300]
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 22.0,
                                          backgroundColor: HexColor('#ff9cab'),
                                          child:Icon(
                                            Icons.location_city_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 20.0,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('City',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(height: 3.0,),
                                            Text(cubit.mentorProfileModel!.city!,
                                              style: TextStyle(
                                                fontSize: 17.0,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.0,),
                                    Container(
                                      height: 1.0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300]
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 22.0,
                                          backgroundColor: HexColor('#a8b7cd'),
                                          child:Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 20.0,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Address',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(height: 3.0,),
                                            Text(cubit.mentorProfileModel!.address!,
                                              style: TextStyle(
                                                fontSize: 17.0,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10.0,),
                                    Container(
                                      height: 1.0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300]
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 22.0,
                                          backgroundColor: HexColor('#326172'),
                                          child:Icon(
                                            Icons.markunread_mailbox_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 20.0,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Zip Code',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(height: 3.0,),
                                            Text(cubit.mentorProfileModel!.zipCode!,
                                              style: TextStyle(
                                                fontSize: 17.0,
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
              ),
            )
          ],
        ),
      );
      },
    );
  }
}

class ReviewItem extends StatelessWidget
{
  ReviewItem({
    Key?key,
     required this.menteePhoto,
     required this.menteeFname,
     required this.menteeLname,
    required this. date,
     required this. content
  }): super(key:key);

   String menteePhoto;
   String menteeFname;
   String menteeLname;
   String date;
   String content;

  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: 210.0,
      width: 260.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage(menteePhoto),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        menteeFname,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 3.0,),
                      Text(
                        menteeLname,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3,),
                  Text(
                    date,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              content,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15.0,
              ),

            ),
          ),

        ],
      ),
    );
  }
}