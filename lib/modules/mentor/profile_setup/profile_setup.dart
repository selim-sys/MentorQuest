
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_cubit.dart';
import 'package:consultation_gp/layout/mentor/mentor_cubit/mentor_states.dart';
import 'package:consultation_gp/modules/login/login_screen/login.dart';
import 'package:consultation_gp/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class ProfileSetup extends StatelessWidget {
   ProfileSetup({Key? key}) : super(key: key);


   final formKey = GlobalKey<FormState>();
   var jobController=TextEditingController();
   var companyController=TextEditingController();
   var skillsController=TextEditingController();
   var addressController=TextEditingController();
   var countryController=TextEditingController();
   var cityController=TextEditingController();
   var zipController=TextEditingController();
   var bioController=TextEditingController();




   @override
   Widget build(BuildContext context) {
     return BlocConsumer<MentorCubit,ConsultStates>(
        listener: (context,state){},
       builder: (context,state)=>Scaffold(
         appBar: AppBar(
           title: Center(child: const Text('Profile setup',)),
         ),
         body: Padding(
           padding:  EdgeInsets.symmetric(horizontal: 30.0.r,vertical: 20.0.r),
           child: SingleChildScrollView(
             scrollDirection: Axis.vertical,
             child: Form(
               key: formKey,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:
                 [
                   Center(
                     child: Stack(children: [
                       Container(
                         padding: EdgeInsets.symmetric(horizontal: 5.r, vertical: 5.r),
                         width: 110.w,
                         height: 110.h,
                         child: CircleAvatar(
                           backgroundColor: Colors.blue,
                           child:
                           MentorCubit.get(context).file == null ?
                           Icon(
                             Icons.account_circle_rounded,
                             color: Colors.white,) :
                           Container(
                             width: 110.w,
                             height: 110.h,
                             decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 image: DecorationImage(
                                   fit: BoxFit.cover,
                                   image: FileImage(MentorCubit.get(context).file!),
                                 )
                             ),
                           ),
                         ),
                       ),
                     ]),
                   ),
                   SizedBox(
                     width: 20.w,
                   ),
                   Row(
                     children: [
                       ElevatedButton(
                         onPressed: ()
                         {
                           MentorCubit.get(context).imagePicker();
                         },
                         child: Text("Upload Image"),
                       ),
                       ElevatedButton(
                         onPressed: ()
                         {
                           MentorCubit.get(context).postImage();
                         },
                         child: Text("Save Image"),
                       ),
                     ],
                   ),
                   SizedBox(height: 20.0.h,),
                   Text(
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 19.sp,
                         color: Colors.grey,
                       ),
                       MentorCubit.get(context).dateController==null?"Date of birth: ${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}":
                       "Date of birth: "
                           "${MentorCubit.get(context).dateController}"),
                   SizedBox(
                     height: 5.h,
                   ),
                   Container(
                     width: double.infinity,
                     child: ElevatedButton(
                         onPressed: ()
                         {
                           MentorCubit.get(context).datePicker(context: context);
                         },
                         child: Text(
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 20.sp,
                             ),
                             "Select a date") ),
                   )
                   ,
                   SizedBox(height: 20.0.h,),
                   Text(
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 19.sp,
                         color: Colors.grey,
                       ),
                       "Job title: "),
                   SizedBox(
                     height: 5.h,
                   ),
                   TextFormField(
                     validator: (value) {
                       if(value!.isEmpty)
                       {
                         return "Please enter your job title";
                       }
                       return null;
                     },
                     controller: jobController,
                     //onSaved: (value) => _firstname = value!,
                     decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.r),
                         borderSide: BorderSide(
                           color: Colors.grey,
                         ),
                       ),
                       focusedBorder: OutlineInputBorder(),
                       hintText: "enter your job title",
                       hintStyle: TextStyle(
                         color: Colors.grey,
                       ),
                     ),
                   ),
                   SizedBox(height: 20.0.h,),
                   Text(
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 19.sp,
                         color: Colors.grey,
                       ),
                       "Company: "),
                   SizedBox(
                     height: 5.h,
                   ),
                   TextFormField(
                     validator: (value) {
                       if(value!.isEmpty)
                       {
                         return "Please enter your company";
                       }
                       return null;
                     },
                     controller: companyController,
                     //onSaved: (value) => _firstname = value!,
                     decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.r),
                         borderSide: BorderSide(
                           color: Colors.grey,
                         ),
                       ),
                       focusedBorder: OutlineInputBorder(),
                       hintText: "enter your company",
                       hintStyle: TextStyle(
                         color: Colors.grey,
                       ),
                     ),
                   ),
                   SizedBox(height: 20.0.h,),
                   Row(
                     children: [
                       Expanded(
                         child: Text(
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 19.sp,
                               color: Colors.grey,
                             ),
                             "Gender: "),
                       ),
                       SizedBox(width: 20.0.w,),
                       Expanded(
                         child:  Text(
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 19.sp,
                               color: Colors.grey,
                             ),
                             "Category: "),
                       ),
                       SizedBox(height: 5.0.h,),
                     ],
                   ),
                   SizedBox(width: 5.0.w,),
                   Row(
                     children:
                     [
                       Expanded(
                         child: DropdownButton(
                           isExpanded: true,
                           hint: Text('Gender'),
                           items: ["male", "female",].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(),
                           onChanged: (val){
                             MentorCubit.get(context).genderDropDown(value: val);
                           },
                           value: MentorCubit.get(context).selectedGender,
                         ),
                       ),
                       SizedBox(width: 20.0.w,),
                       Expanded(
                         child: DropdownButton(
                           isExpanded: true,
                           hint: Text('Category'),
                           items: ["Software", "Marketing","Business",].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(),
                           onChanged: (val){
                             MentorCubit.get(context).categoryDropDown(value: val);
                           },
                           value: MentorCubit.get(context).selectedCategory,
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 20.0.h,),
                   Row(
                     children: [
                       Expanded(
                         child: Text(
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 19.sp,
                               color: Colors.grey,
                             ),
                             "Experience: "),
                       ),
                       SizedBox(width: 20.0.w,),
                       Expanded(
                         child:  Text(
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 19.sp,
                               color: Colors.grey,
                             ),
                             "Years of Exp: "),
                       ),
                       SizedBox(height: 5.0.h,),
                     ],
                   ),
                   SizedBox(width: 5.0.w,),
                   Row(
                     children:
                     [
                       Expanded(
                         child: DropdownButton(
                           isExpanded: true,
                           hint: Text('Experience'),
                           items: ["Senior", "Junior","Mid-Level",].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(),
                           onChanged: (val){
                             MentorCubit.get(context).experienceDropDown(value: val);
                           },
                           value: MentorCubit.get(context).selectedExperience,
                         ),
                       ),
                       SizedBox(width: 20.0.w,),
                       Expanded(
                         child: DropdownButton(
                           isExpanded: true,
                           hint: Text('Years of Exp'),

                           onChanged: (val){
                             MentorCubit.get(context).yearsDropDown(value: val);
                           },
                           value: MentorCubit.get(context).selectedYears,
                           items: ["5", "6","7","8", "9","10","11", "12","13","14", "15","16","17", "18","19","20", "21","22","23", "24","25",].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(),

                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 20.0.h,),
                   Text(
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 19.sp,
                         color: Colors.grey,
                       ),
                       "Skills: "),
                   SizedBox(
                     height: 5.h,
                   ),
                   TextFormField(
                     validator: (value) {
                       if(value!.isEmpty)
                       {
                         return "Please enter your Skills";
                       }
                       return null;
                     },
                     controller: skillsController,
                     //onSaved: (value) => _firstname = value!,
                     decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.r),
                         borderSide: BorderSide(
                           color: Colors.grey,
                         ),
                       ),
                       focusedBorder: OutlineInputBorder(),
                       hintText: "flutter , dart , php , laravel",
                       hintStyle: TextStyle(
                         color: Colors.grey,
                       ),
                     ),
                   ),
                   SizedBox(height: 20.0.h,),
                   Text(
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 19.sp,
                         color: Colors.grey,
                       ),
                       "Address: "),
                   SizedBox(
                     height: 5.h,
                   ),
                   TextFormField(
                     validator: (value) {
                       if(value!.isEmpty)
                       {
                         return "Please enter your address";
                       }
                       return null;
                     },
                     controller: addressController,
                     //onSaved: (value) => _firstname = value!,
                     decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(
                           color: Colors.grey,
                         ),
                       ),
                       focusedBorder: OutlineInputBorder(),
                       hintText: "enter your address",
                       hintStyle: TextStyle(
                         color: Colors.grey,
                       ),
                     ),
                   ),
                   SizedBox(height: 20.0.h,),
                   Text(
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 19.sp,
                         color: Colors.grey,
                       ),
                       "Country: "),
                   SizedBox(
                     height: 5.h,
                   ),
                   TextFormField(
                     validator: (value) {
                       if(value!.isEmpty)
                       {
                         return "Please enter your country";
                       }
                       return null;
                     },
                     controller: countryController,
                     //onSaved: (value) => _firstname = value!,
                     decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.r),
                         borderSide: BorderSide(
                           color: Colors.grey,
                         ),
                       ),
                       focusedBorder: OutlineInputBorder(),
                       hintText: "enter your country",
                       hintStyle: TextStyle(
                         color: Colors.grey,
                       ),
                     ),
                   ),
                   SizedBox(height: 20.0.h,),
                   Text(
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 19.sp,
                         color: Colors.grey,
                       ),
                       "City: "),
                   SizedBox(
                     height: 5.h,
                   ),
                   TextFormField(
                     validator: (value) {
                       if(value!.isEmpty)
                       {
                         return "Please enter your city";
                       }
                       return null;
                     },
                     controller: cityController,
                     //onSaved: (value) => _firstname = value!,
                     decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.r),
                         borderSide: BorderSide(
                           color: Colors.grey,
                         ),
                       ),
                       focusedBorder: OutlineInputBorder(),
                       hintText: "enter your city",
                       hintStyle: TextStyle(
                         color: Colors.grey,
                       ),
                     ),
                   ),
                   SizedBox(height: 20.0.h,),
                   Text(
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 19.sp,
                         color: Colors.grey,
                       ),
                       "Zip code: "),
                   SizedBox(
                     height: 5.h,
                   ),
                   TextFormField(
                     validator: (value) {
                       if(value!.isEmpty)
                       {
                         return "Please enter your zip code";
                       }
                       return null;
                     },
                     controller: zipController,
                     //onSaved: (value) => _firstname = value!,
                     decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.r),
                         borderSide: BorderSide(
                           color: Colors.grey,
                         ),
                       ),
                       focusedBorder: OutlineInputBorder(),
                       hintText: "enter your zip code",
                       hintStyle: TextStyle(
                         color: Colors.grey,
                       ),
                     ),
                   ),
                   SizedBox(height: 20.0.h,),
                   Text(
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 19.sp,
                         color: Colors.grey,
                       ),
                       "Bio: "),
                   SizedBox(
                     height: 5.h,
                   ),
                   TextFormField(
                     maxLines: 5,
                     validator: (value) {
                       if(value!.isEmpty)
                       {
                         return "Please enter your bio";
                       }
                       return null;
                     },
                     controller: bioController,
                     //onSaved: (value) => _firstname = value!,
                     decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.r),
                         borderSide: BorderSide(
                           color: Colors.grey,
                         ),
                       ),
                       focusedBorder: OutlineInputBorder(),
                       hintText: "enter your bio",
                       hintStyle: TextStyle(
                         color: Colors.grey,
                       ),
                     ),
                   ),
                   SizedBox(height: 20.0.h,),
                   Center(
                     child: Container(
                       height: 50.0.h,
                       width: 100.0.w,
                       child: ElevatedButton(
                         onPressed: ()
                         {
                           if(formKey.currentState!.validate())
                           {
                             MentorCubit.get(context).profileSetup(
                                 jobTitle: jobController.text.trim(),
                                 company: companyController.text.trim(),
                                 skills: skillsController.text.trim(),
                                 country: countryController.text.trim(),
                                 city: cityController.text.trim(),
                                 address: addressController.text.trim(),
                                 zipCode: zipController.text.trim(),
                                 bio: bioController.text.trim(),
                                 context: context
                             );
                           }
                           MentorCubit.get(context).postImage();
                           MentorCubit.get(context).getTimes();
                           MentorCubit.get(context).getMentorDashboardData();
                           MentorCubit.get(context).getProfileData();
                         },
                         child: Text("Submit",
                           style:TextStyle(
                               fontSize: 20.0.sp
                           )
                           ,),
                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),
         ),
       ),
     );
   }
}


