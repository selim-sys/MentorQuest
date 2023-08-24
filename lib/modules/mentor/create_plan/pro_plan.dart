import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_cubit.dart';
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_states.dart';
import 'package:consultation_gp/layout/mentor/mentor_layout/mentor_layout.dart';
import 'package:consultation_gp/modules/mentor/create_plan/per_session_plan.dart';
import 'package:consultation_gp/modules/mentor/create_plan/standard_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProPlan extends StatelessWidget
{
  ProPlan({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  var descriptionController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MentorCubit,ConsultStates>(
      listener: (context,state){},
      builder: (context,state)=> Scaffold(
        appBar: AppBar(
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
                   padding: EdgeInsets.all(5.0.r),
                   child: SizedBox(
                     height: 610.h,
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
                               borderRadius: BorderRadius.circular(10.0.r)
                           ),
                           child: Padding(
                             padding:EdgeInsets.all(10.0.r),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children:
                               [
                                 Center(child:Text('Pro plan',
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
                                     if(value!.isEmpty)
                                     {
                                       return "Please choose an answer";
                                     }
                                     return null;
                                   },
                                   value: MentorCubit.get(context).selectedNumberOfSessionsProPlan,
                                   items: MentorCubit.get(context).numberOfSessions.map((item) => DropdownMenuItem<String>(
                                     value: item.toString(),
                                     child: Text(item.toString(),style: TextStyle(fontSize: 20.sp),),
                                   ))
                                       .toList(),
                                   onChanged: (item)=>MentorCubit.get(context).proSessionsDropDown(),
                                   decoration: InputDecoration(
                                     enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(12),
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
                                     if(value!.isEmpty)
                                     {
                                       return "Please choose an answer";
                                     }
                                     return null;
                                   },
                                   value: MentorCubit.get(context).selectedResponseTimeProPlan,
                                   items: MentorCubit.get(context).responseTimes.map((item) => DropdownMenuItem<String>(
                                     value: item,
                                     child: Text(item,style: TextStyle(fontSize: 20.sp),),
                                   ))
                                       .toList(),
                                   onChanged: (item)=>MentorCubit.get(context).proResponseDropDown(),
                                   decoration: InputDecoration(
                                     enabledBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(12),
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
                                     if(value!.isEmpty)
                                     {
                                       return "Please enter plan description";
                                     }
                                     return null;
                                   },
                                   decoration: InputDecoration(
                                     enabledBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10.r),
                                         borderSide: BorderSide(
                                             color: Colors.grey
                                         )
                                     ),
                                     focusedBorder: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(10.r),
                                         borderSide: BorderSide(
                                             color: Colors.blue
                                         )
                                     ),
                                     hintText: " apply for my plan and improve your skills ",
                                     hintStyle: TextStyle(
                                       color: Colors.grey,
                                       fontSize: 15.sp,
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
                                     DropdownButtonFormField<String>(
                                       validator: (value) {
                                         if(value!.isEmpty||value==null)
                                         {
                                           return "Please choose 1 or 0";
                                         }
                                         return null;
                                       },
                                       value: MentorCubit.get(context).selectedProChat,
                                       items: MentorCubit.get(context).proChatList.map((item) => DropdownMenuItem<String>(
                                         value: item,
                                         child: Text(item,style: TextStyle(fontSize: 16.sp),),
                                       ))
                                           .toList(),
                                       onChanged: (item)=>MentorCubit.get(context).ProChatDropDown(),
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
                                   padding:  EdgeInsets.all(5.0.r),
                                   child: Center(
                                     child: SizedBox(
                                       width: 240,
                                       child: DropdownButtonFormField<String>(
                                         validator: (value) {
                                           if(value!.isEmpty)
                                           {
                                             return "Please choose a price";
                                           }
                                           return null;
                                         },
                                         value: MentorCubit.get(context).selectedPriceProPlan,
                                         items: MentorCubit.get(context).prices.map((item) => DropdownMenuItem<String>(
                                           value: item.toString(),
                                           child: Text(item.toString(),style: TextStyle(fontSize: 20.sp),),
                                         ))
                                             .toList(),
                                         onChanged: (item)=>MentorCubit.get(context).proPriceDropDown(),
                                         decoration: InputDecoration(
                                           enabledBorder: OutlineInputBorder(
                                             borderRadius: BorderRadius.circular(12),
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
                 SizedBox(height:MediaQuery.of(context).size.height/100),
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
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => StandardPlan(),));
                          },
                          child: Center(
                            child: Text(
                              'Back',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0.sp
                              ),
                            ),
                          ),

                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 40.0.h,
                        width: 90.w,
                        child: ElevatedButton
                          (
                          onPressed: ()
                          {
                            if(formKey.currentState!.validate()){
                              MentorCubit.get(context).storeProPlan(
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