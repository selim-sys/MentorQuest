import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_cubit.dart';
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_states.dart';
import 'package:consultation_gp/modules/mentee/mentee_profile.dart';
import 'package:consultation_gp/modules/mentor/dashboard/view_mentee_request/view_mentee_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatelessWidget {
   Dashboard({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MentorCubit,ConsultStates>(
      listener: (context,state){},
      builder: (context,state)=>Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  const Text(
            'Dashboard',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0
            ),
          ),
          elevation: 0.0,
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
            ConditionalBuilder(
                condition: state is MentorDashboardLoadingState||MentorCubit.get(context).mentorDashboardModel==null||MentorCubit.get(context).mentorProfileModel==null,
                builder: (context)=>Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Colors.white,),
                      SizedBox(height: 20,),
                      Text('loading your data...',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
                fallback: (context)=> SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
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
                                  value:MentorCubit.get(context).dashboardModel!.progress!.toDouble(),
                                  minHeight: 4.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child:
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 120.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: HexColor('#dce8ff'),
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                  [
                                    Icon(
                                      Icons.group,
                                      size: 30.0,
                                    ),
                                    SizedBox(height: 5.0,),
                                    Text(
                                      '${MentorCubit.get(context).mentorDashboardModel!.data!.statistics!.members}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0
                                      ),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Text('Members')
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 9.0,),
                            Expanded(
                              child: Container(
                                height: 120.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: HexColor('#fcf6d4'),
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                  [
                                    Icon(
                                      Icons.date_range,
                                      size: 30.0,
                                    ),
                                    SizedBox(height: 5.0,),
                                    Text(
                                      '${MentorCubit.get(context).mentorDashboardModel!.data!.statistics!.appointments}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0
                                      ),
                                    ),
                                    SizedBox(height: 5.0,),

                                    Text('Appointments')
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 9.0,),
                            Expanded(
                              child: Container(
                                height: 120.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: HexColor('#fedde6'),
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                  [
                                    Icon(
                                      Icons.account_balance_wallet,
                                      size: 30.0,
                                    ),
                                    SizedBox(height: 5.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${MentorCubit.get(context).mentorDashboardModel!.data!.statistics!.money}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.0
                                          ),
                                        ),
                                        Text(
                                          '\$',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.0
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.0,),
                                    Text('Total Earned')
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Clients List',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                      ConditionalBuilder(
                          condition: state is GetBookingsLoadingState,
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
                              condition: MentorCubit.get(context).bookingsModel!.data==null,
                              builder: (context)=>Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(child: Text('There is no clients,yet',style: TextStyle(fontSize: 16.0),)),
                              ),
                              fallback:(context)=> ListView.separated(
                                physics: NeverScrollableScrollPhysics(),///مرلول على مرلول ميرولش
                                shrinkWrap: true,
                                itemBuilder: (context,index)=>Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 180,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(10.0)
                                        ),
                                      ),
                                      Container(
                                        height: 175.0,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10.0)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 35.0,
                                                    backgroundImage: NetworkImage(MentorCubit.get(context).bookingsModel!.data![index].mentee!.image!
                                                    ),
                                                  ),
                                                  SizedBox(width: 10.0,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            MentorCubit.get(context).bookingsModel!.data![index].mentee!.fname!,
                                                            style: TextStyle(
                                                                fontSize: 17.0,
                                                                fontWeight: FontWeight.bold
                                                            ),
                                                          ),
                                                          SizedBox(width:3.0 ),
                                                          Text(
                                                            MentorCubit.get(context).bookingsModel!.data![index].mentee!.lname!,
                                                            style: TextStyle(
                                                                fontSize: 17.0,
                                                                fontWeight: FontWeight.bold
                                                            ),
                                                          ),
                                                          SizedBox(width:62.0 ),
                                                          /*IconButton(
                                                              onPressed: ()
                                                              {
                                                                MentorCubit.get(context).changePinIcon(index);
                                                              },
                                                              icon: MentorCubit.get(context).isPinned&&MentorCubit.get(context).iPin==index?
                                                              Icon(Icons.push_pin_rounded,size: 22.0,color: Colors.blue,):
                                                              Icon(Icons.push_pin_outlined,size: 22.0,color: Colors.grey,)
                                                          )*/
                                                        ],
                                                      ),
                                                      //SizedBox(height: 3,),
                                                      Text(
                                                        MentorCubit.get(context).bookingsModel!.data![index].mentee!.email!,
                                                        style: TextStyle(
                                                            fontSize: 15.0,
                                                            color: Colors.black
                                                        ),
                                                      ),
                                                      SizedBox(height: 3,),
                                                      Row(
                                                        children:
                                                        [
                                                          Icon(
                                                            Icons.date_range,
                                                            size: 20.0,
                                                            color: Colors.grey,
                                                          ),
                                                          SizedBox(width: 2.0,),
                                                          Text(MentorCubit.get(context).bookingsModel!.data![index].createdAt!),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 8,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                      width: 100.0,
                                                      child:  ElevatedButton.icon(
                                                        onPressed: ()
                                                        {
                                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewMenteeRequestScreen()));
                                                          MentorCubit.get(context).getBookingDetails(bookingId: MentorCubit.get(context).bookingsModel!.data![index].id!);
                                                        },
                                                        icon: Icon(Icons.remove_red_eye_rounded),
                                                        label: Text('View',
                                                          style: TextStyle(
                                                              fontSize: 15.0
                                                          ),),
                                                        style: ElevatedButton.styleFrom(
                                                            primary: HexColor('#b6d0e7'),
                                                            elevation: 0.0
                                                        ),
                                                      )
                                                  ),
                                                  SizedBox(width: 70.0),
                                                  IconButton(
                                                      iconSize:42.0,
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
                                                                          MentorCubit.get(context).cancelBooking(cancelledBookingId: MentorCubit.get(context).bookingsModel!.data![index].id!);
                                                                          Navigator.pop(context);
                                                                        }

                                                                      },
                                                                      icon: Icon(Icons.check),
                                                                      label: Text('Confirm',
                                                                        style: TextStyle(
                                                                            fontSize: 15.0
                                                                        ),),
                                                                      style: ElevatedButton.styleFrom(
                                                                        primary:Colors.blue,
                                                                      ),
                                                                    )
                                                                )
                                                            ),
                                                          ],
                                                          content: Container(
                                                            height: 200,
                                                            width: 130,
                                                            padding: EdgeInsets.all(8),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(20.0),
                                                              child: Form(
                                                                key: formKey,
                                                                child: Column(
                                                                  children: [
                                                                    Text('Please, choose your refuse reason',
                                                                      style: TextStyle(
                                                                          fontSize: 20.0,
                                                                          fontWeight: FontWeight.bold
                                                                      ),),
                                                                    SizedBox(height: 20.0,),
                                                                    DropdownButtonFormField<String>(
                                                                      isExpanded: true,
                                                                      validator: (value) {
                                                                        if(value==null||value.isEmpty)
                                                                        {
                                                                          return "Please choose a reason";
                                                                        }
                                                                        return null;
                                                                      },
                                                                      value: MentorCubit.get(context).selectedReason,
                                                                      items: MentorCubit.get(context).listOfReasons.map((item) => DropdownMenuItem<String>(
                                                                        value: item,
                                                                        child: Text(item,style: TextStyle(fontSize: 15.sp),),
                                                                      ))
                                                                          .toList(),
                                                                      onChanged: (item)=>MentorCubit.get(context).refuseReasonDropDown(value: item),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ));
                                                      },
                                                      icon:Icon(Icons.cancel,color:Colors.red,)),
                                                  IconButton(
                                                      iconSize:42.0,
                                                      onPressed: ()
                                                      {
                                                    MentorCubit.get(context).acceptBooking(acceptedBookingId: MentorCubit.get(context).bookingsModel!.data![index].id!);
                                                    },
                                                      icon:Icon(Icons.check_circle,color:Colors.green,)),


                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                separatorBuilder: (context,index)=>SizedBox(height: 5.0,),
                                itemCount: MentorCubit.get(context).bookingsModel!.data!.length,

                              ),
                          )
                      ),


                    ],
                  ),
                ),
    )],
        ),
      ),
      
    );
  }
}

/*
/// هتبعت هنا ال index بتاع الكارت وااول ما يدوس على الصح تقبله من خلال الاندكس وكذلك مع ال كانسل
Widget clientRequestCard({required context})=> Padding(
  padding: const EdgeInsets.all(20.0),
  child: Stack(
    children: [
      Container(
        height: 155,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
      Container(
        height: 150.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(

                    radius: 35.0,
                  ),
                  SizedBox(width: 10.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hassanien',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 3,),
                      Text(
                        'amin@gmail.com',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black
                        ),
                      ),
                      SizedBox(height: 3,),
                      Row(
                        children:
                        [
                          Icon(
                            Icons.date_range,
                            size: 20.0,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 2.0,),
                          Text('10/2/2022'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(iconSize:42.0,  onPressed: (){}, icon:Icon(Icons.check_circle,color:Colors.green,)),

                  IconButton(iconSize:42.0,  onPressed: (){
                    cancelDialog(context: context);
                  }, icon:Icon(Icons.cancel,color:Colors.red,)),

                  Container(
                      width: 100.0,
                      height: 37.0,

                      child:  Center(
                          child: ElevatedButton.icon(
                            onPressed: ()
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MenteeProfile()));
                            },
                            icon: Icon(Icons.flag),
                            label: Text('Pin',
                              style: TextStyle(
                                  fontSize: 15.0
                              ),),
                            style: ElevatedButton.styleFrom(
                                primary:Colors.orange,
                                elevation: 0.0
                            ),
                          )
                      )
                  ),
                  SizedBox(width: 20.0),
                  Container(
                      width: 100.0,
                      child:  ElevatedButton.icon(
                        onPressed: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewMenteeRequestScreen()));
                        },
                        icon: Icon(Icons.remove_red_eye_rounded),
                        label: Text('View',
                          style: TextStyle(
                              fontSize: 15.0
                          ),),
                        style: ElevatedButton.styleFrom(
                            primary: HexColor('#b6d0e7'),
                            elevation: 0.0
                        ),
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ],
  ),
);*/


Future<dynamic> cancelDialog({
  required context,
  required int index

}) => showDialog(
  context: context,
  builder: (context){
    return AlertDialog(


      contentPadding: const EdgeInsets.all(0.0),
      content:  Container(
        height: 250,
        padding: EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('Please, choose your refuse reason',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),),
              SizedBox(height: 20.0,),
              DropdownButton(
                isExpanded: false,
                hint: Text('selact a message'),
                items: [
                  "Sorry, i am busy",
                  "I can't help you with your problem",
                  "choose an available time ,please",
                  "Send me later",
                ].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(),
                onChanged: (val){
                 MentorCubit.get(context).refuseReasonDropDown(value: val);
                },
                value: MentorCubit.get(context).selectedReason,
                //menuMaxHeight: 60.0,
              ),
              SizedBox(height: 30.0,),
              Container(
                  width: 130.0,
                  height: 40.0,

                  child:  Center(
                      child: ElevatedButton.icon(
                        onPressed: ()
                        {
                          MentorCubit.get(context).cancelBooking(cancelledBookingId: MentorCubit.get(context).bookingsModel!.data![index].id!);
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.check),
                        label: Text('Confirm',
                          style: TextStyle(
                              fontSize: 15.0
                          ),),
                        style: ElevatedButton.styleFrom(
                            primary:Colors.blue,
                        ),
                      )
                  )
              ),


            ],
          ),
        ),
      ),
    );
  },
);



