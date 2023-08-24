import 'package:consultation_gp/modules/login/login_screen/login.dart';
import 'package:consultation_gp/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MenteeSetting extends StatefulWidget {
  MenteeSetting({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  var fNameController =TextEditingController();
  var lNameController =TextEditingController();
  var userNameController =TextEditingController();
  var emailController =TextEditingController();
  var pNumController =TextEditingController();
  var passwordController =TextEditingController();
  var cPasswordController =TextEditingController();

  @override
  State<MenteeSetting> createState() => _MenteeSettingState();
}

class _MenteeSettingState extends State<MenteeSetting> {
  var selectedCategroy,selectedSkills,selectedExperience,selectedGender;
  DateTime date = DateTime.now();
  File _file = File("")  ;
  Future pickerCamera ()async{
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(myfile!.path) ;
    });
  }
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Mentee Setting',)),
      ),
      body: Padding(
        padding:  EdgeInsets.all(30.0.r),
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
                      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                      width: 90.w,
                      height: 90.h,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                        _file == null ?
                        Icon(
                          Icons.account_circle_rounded,
                          color: Colors.white,) :
                        Container(
                          width: 90.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: FileImage(_file),
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
                Center(
                  child: ElevatedButton(
                    onPressed: pickerCamera,
                    child: Text("Upload Image"),
                  ),
                ),
                SizedBox(height: 20.0.h,),
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return "Please enter first name";
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(),
                    labelText: "First Name",
                    hintText: "enter your first name",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/30,),
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return "Please enter last name";
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(),
                    labelText: "Last Name",
                    hintText: "enter your last name",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/30,),
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return "Please enter Username";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(),
                    labelText: "Username",
                    hintText: "enter your username",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/30,),
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return "Please enter an email";
                    }
                    if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                      return 'Please enter a valid Email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(),
                    labelText: "E-mail",
                    hintText: "enter your email",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/30,),
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty)
                    {
                      return "Please enter phone number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(),
                    labelText: "Phone Number",
                    hintText: "enter your phone number",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                
                SizedBox(height: MediaQuery.of(context).size.height/20,),
                Center(
                  child: Container(
                    width: 100.w,
                    height: 35.h,
                    child: ElevatedButton(onPressed: () {

                    }, child: Text("Submit",style: TextStyle(fontSize: 17.0.sp),)),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
