
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_cubit.dart';
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_states.dart';
import 'package:consultation_gp/layout/mentor/mentor_layout/mentor_layout.dart';
import 'package:consultation_gp/modules/mentor/create_plan/pro_plan.dart';
import 'package:consultation_gp/modules/mentor/mentor_profile/mentor_profile.dart';
import 'package:consultation_gp/modules/mentor/profile_setup/profile_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_switch/sliding_switch.dart';

class StandardPlan extends StatelessWidget
{
  StandardPlan({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  var descriptionController=TextEditingController();

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<MentorCubit,ConsultStates>(
     listener: (context,state){},
     builder: (context,state)=> Scaffold(
       appBar: AppBar(
         leading: IconButton(  iconSize: 25.0.sp,
             icon: const Icon(Icons.arrow_back_ios),
             onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(
                 builder: (context) => MentorLayout(),));
             }),
         title:  Text('Create your plan',style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 18.0.sp
         ),
         ),
         centerTitle: true,
       ),
       body: Padding(
         padding:  EdgeInsets.all(20.0.r),
         child: SingleChildScrollView(
           scrollDirection: Axis.vertical,
           child: Form(
             key: formKey,
             child: Column(
               children: [
                 Padding(
                   padding:  EdgeInsets.all(5.0.r),
                   child: SizedBox(
                     height: 650.h,
                     child: Column(
                       children: [
                         Container(
                           //height: 580,
                           //width: double.infinity.w,
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
                           child: Padding(
                             padding:  EdgeInsets.all(10.0.r),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children:
                               [
                                 Center(child: Text('Standard plan',
                                   style: TextStyle(
                                       fontSize: 25.0.sp,
                                       fontWeight: FontWeight.bold
                                   ),
                                 )),
                                 SizedBox(height:MediaQuery.of(context).size.height/30),
                                 Text('Number of sessions (per month) : ',
                                   style: TextStyle(
                                       fontSize: 15.0.sp,
                                       fontWeight: FontWeight.bold
                                   ),
                                 ),
                                 SizedBox(height:MediaQuery.of(context).size.height/60),
                                 DropdownButtonFormField<String>(
                                   validator: (value) {
                                     if(value!.isEmpty||value==null)
                                     {
                                       return "Please choose an answer";
                                     }
                                     return null;
                                   },
                                   value: MentorCubit.get(context).selectedNumberOfSessions,
                                   items: MentorCubit.get(context).numberOfSessions.map((item) => DropdownMenuItem<String>(
                                     value: item.toString(),
                                     child: Text(item.toString(),style: TextStyle(fontSize: 20.sp),),
                                   ))
                                       .toList(),
                                   onChanged: (item)=>MentorCubit.get(context).standardSessionsDropDown(),
                                   decoration: InputDecoration(
                                     enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10),
                                       borderSide: BorderSide(width: 3,color: Colors.blue),
                                     ),
                                     focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10),
                                       borderSide: BorderSide(width: 3,color: Colors.blue),
                                     ),
                                   ),
                                 ),
                                 SizedBox(height:MediaQuery.of(context).size.height/40),
                                 Text('Chat response time in : ',
                                   style: TextStyle(
                                       fontSize: 15.0.sp,
                                       fontWeight: FontWeight.bold
                                   ),
                                 ),
                                 SizedBox(height:MediaQuery.of(context).size.height/60),
                                 DropdownButtonFormField<String>(
                                   validator: (value) {
                                     if(value!.isEmpty||value==null)
                                     {
                                       return "Please choose an answer";
                                     }
                                     return null;
                                   },
                                   value:MentorCubit.get(context).selectedResponseTime,
                                   items: MentorCubit.get(context).responseTimes.map((item) => DropdownMenuItem<String>(
                                     value: item,
                                     child: Text(item,style: TextStyle(fontSize: 20.sp),),
                                   ))
                                       .toList(),
                                   onChanged: (item)=>MentorCubit.get(context).standardResponseDropDown(),
                                   decoration: InputDecoration(
                                     enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10),
                                       borderSide: BorderSide(width: 3,color: Colors.blue),
                                     ),
                                     focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10),
                                       borderSide: BorderSide(width: 3,color: Colors.blue),
                                     ),
                                   ),
                                 ),
                                 SizedBox(height:MediaQuery.of(context).size.height/40),
                                 Text('Plan description : ',
                                   style: TextStyle(
                                       fontSize: 15.0.sp,
                                       fontWeight: FontWeight.bold

                                   ),
                                 ),
                                 SizedBox(height:MediaQuery.of(context).size.height/60),
                                 TextFormField(
                                   controller: descriptionController,
                                   maxLines: 5,
                                   validator: (value) {
                                     if(value!.isEmpty||value==null)
                                     {
                                       return "Please enter plan description";
                                     }
                                     return null;
                                   },
                                   decoration: InputDecoration(
                                     enabledBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10),
                                         borderSide: BorderSide(
                                             color: Colors.grey
                                         )
                                     ),
                                     focusedBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10),
                                         borderSide: BorderSide(
                                             color: Colors.blue
                                         )
                                     ),
                                     hintText: " apply for my plan and improve your skills ",
                                     hintStyle: TextStyle(
                                       fontSize: 15.sp,
                                       color: Colors.grey,
                                     ),
                                   ),
                                 ),
                                 SizedBox(height:MediaQuery.of(context).size.height/40),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Text('Unlimited Q&A chat',
                                       style: TextStyle(
                                           fontSize: 15.0.sp,
                                           fontWeight: FontWeight.bold
                                       ),
                                     ),
                                     SizedBox(width: 50.0,),
                                     Container(
                                       //height: 50.0,
                                       width: 150.0,
                                       child: DropdownButtonFormField<String>(
                                         isExpanded: true,
                                         validator: (value) {
                                           if(value==null||value.isEmpty)
                                           {
                                             return "Please choose 1 or 0";
                                           }
                                           return null;
                                         },
                                         value: MentorCubit.get(context).selectedStandardChat,
                                         items: MentorCubit.get(context).standardChatList.map((item) => DropdownMenuItem<String>(
                                           value: item,
                                           child: Text(item,style: TextStyle(fontSize: 16.sp),),
                                         ))
                                             .toList(),
                                         onChanged: (item)=>MentorCubit.get(context).standardChatDropDown(),
                                       ),
                                     ),
                                   ],
                                 ),
                                 SizedBox(height:MediaQuery.of(context).size.height/40),
                                 Center(
                                   child: Text('Price',
                                     style: TextStyle(
                                         fontSize: 15.0.sp,
                                         fontWeight: FontWeight.bold
                                     ),
                                   ),
                                 ),
                                 SizedBox(height:MediaQuery.of(context).size.height/60),
                                 Padding(
                                   padding:  EdgeInsets.only(bottom: 5.0.r),
                                   child: Center(
                                     child: SizedBox(
                                       width: 240,
                                       child: DropdownButtonFormField<String>(
                                         validator: (value) {
                                           if(value!.isEmpty||value==null)
                                           {
                                             return "Please choose a price";
                                           }
                                           return null;
                                         },
                                         value: MentorCubit.get(context).selectedPrice,
                                         items: MentorCubit.get(context).prices.map((item) => DropdownMenuItem<String>(
                                           value: item.toString(),
                                           child: Text(item.toString(),style: TextStyle(fontSize: 20.sp),),
                                         ))
                                             .toList(),
                                         onChanged: (item)=>MentorCubit.get(context).standardPriceDropDown(),
                                         decoration: InputDecoration(
                                           enabledBorder: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(10),
                                             borderSide: BorderSide(width: 3,color: Colors.blue),
                                           ),
                                           focusedBorder: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(10),
                                             borderSide: BorderSide(width: 3,color: Colors.blue),
                                           ),
                                         ),
                                       ),
                                     ),
                                   ),
                                 ),


                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Container(
                       height: 40.0.h,
                       width: 90.w,
                       child: ElevatedButton
                         (
                         onPressed: ()
                         {
                           if(formKey.currentState!.validate()){
                             MentorCubit.get(context).storeStandardPlan(
                                 planDesc: descriptionController.text.trim(),
                                 context: context);
                           }

                         },
                         child: Center(
                           child: Text(
                             'Next',
                             style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 18.0.sp
                             ),
                           ),
                         ),

                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ),
         ),
       ),
     ),
   );

  }

}















