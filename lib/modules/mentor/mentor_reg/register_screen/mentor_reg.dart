import 'package:consultation_gp/modules/login/login_screen/login.dart';
import 'package:consultation_gp/modules/mentor/mentor_reg/register_cubit/register_cubit.dart';
import 'package:consultation_gp/modules/mentor/mentor_reg/register_cubit/register_states.dart';
import 'package:consultation_gp/modules/mentor/profile_setup/profile_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MentorReg extends StatefulWidget {
  MentorReg({Key? key}) : super(key: key);

  @override
  State<MentorReg> createState() => _MentorRegState();
}

class _MentorRegState extends State<MentorReg> {
  // var _selectedLocation ;
  final _formkey = GlobalKey<FormState>();
  var fNameController =TextEditingController();
  var lNameController =TextEditingController();
  var emailController =TextEditingController();
  var pNumController =TextEditingController();
  var passwordController =TextEditingController();
  var cPasswordController =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>
        (
        listener:(context,state)
        {
          /*if(state is RegisterSuccessState)
          {
           if(state.loginModel.success!)
           {
             Navigator.pushReplacement(context,
                 MaterialPageRoute(builder: (context) => ProfileSetup()));
           }
           else
           {
             Fluttertoast.showToast(
               msg: state.loginModel.message!,
               toastLength: Toast.LENGTH_LONG,
               gravity: ToastGravity.BOTTOM,
               timeInSecForIosWeb: 10,
               backgroundColor: Colors.red,
               textColor: Colors.white,
               fontSize: 20.0,
             );
           }
          }*/
        } ,
        builder:(context,state)
        {
          return Scaffold(
              appBar: AppBar(
                title: Padding(
                  padding:  EdgeInsets.only(left: 12.0.r),
                  child: Text("Mentor Register"),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.all(30.0.r),
                  child: Form(
                    key: _formkey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(8.0.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /* Stack(children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                            width: 70,
                            height: 70,
                            child: CircleAvatar(
                              child: Icon(Icons.account_circle_rounded),
                            ),
                          ),
                        ]),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Upload Image"),
                        )*/
                              ],
                            ),
                          ),
                          Text(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19.sp,
                                color: Colors.grey,
                              ),
                              "First Name: "),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            validator: (value) {
                              if(value!.isEmpty)
                              {
                                return "Please enter first name";
                              }
                              return null;
                            },
                            controller: fNameController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              //labelText: "First Name",
                              hintText: "enter your first name",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Text(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19.sp,
                                color: Colors.grey,
                              ),
                              "Last Name: "),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            validator: (value) {
                              if(value!.isEmpty)
                              {
                                return "Please enter last name";
                              }
                              return null;
                            },
                            controller: lNameController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              //labelText: "Last Name",
                              hintText: "enter your last name",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Text(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19.sp,
                                color: Colors.grey,
                              ),
                              "E-mail: "
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            validator: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return "Please enter an email";
                              }
                              if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                                return 'Please enter a valid Email';
                              }
                              return null;
                            },
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              // labelText: "E-mail",
                              hintText: "enter your email",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Text(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19.sp,
                                color: Colors.grey,
                              ),
                              "Phone Number: "),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            validator: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return "Please enter phone number";
                              }
                              return null;
                            },
                            controller: pNumController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              // labelText: "Phone Number",
                              hintText: "enter your phone number",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Text(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19.sp,
                                color: Colors.grey,
                              ),
                              "Password: "),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            validator: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return "Please enter a password";
                              }
                              return null;
                            },
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: RegisterCubit.get(context).isOb,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: ()
                                {
                                  RegisterCubit.get(context).obscureRegister();
                                },
                                icon: RegisterCubit.get(context).isOb ? Icon(Icons.visibility_off) : Icon(Icons
                                    .visibility),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              //labelText: "Password",
                              hintText: "enter your password",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Text(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19.sp,
                                color: Colors.grey,
                              ),
                              "Confirm Password: "),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            validator: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'Please re-enter password';
                              }
                              else if(passwordController.text.trim()!=cPasswordController.text.trim()){
                                return "Password does not match";
                              }
                              return null;
                            },
                            controller: cPasswordController,
                            obscureText: RegisterCubit.get(context).isOb,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  RegisterCubit.get(context).obscureRegister();
                                },
                                icon: RegisterCubit.get(context).isOb ? Icon(Icons.visibility_off) : Icon(Icons
                                    .visibility),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              //labelText: "confirm Password",
                              hintText: "enter password again",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
/*              Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Colors.grey,
                      ),
                      "Location: "),
                SizedBox(
                    height: 5,
                ),*/
/*    DropdownButton(
        hint: Text("Choose your location"),
        isExpanded: true,
        items: ["Egypt", "UAE","USA","SY"].map((e) => DropdownMenuItem(child: Text("$e"),value: e,)).toList(),
        onChanged: (val){
            setState(() {
              _selectedLocation = val;
            });
        },
        value: _selectedLocation,
      ),
        SizedBox(height: 7,),*/
                          Center(
                            child: ElevatedButton(
                                onPressed: ()
                                {
                                  if (_formkey.currentState!.validate())
                                  {
                                    RegisterCubit.get(context).mentorRegister(
                                        fName: fNameController.text.trim(),
                                        lName: lNameController.text.trim(),
                                        email: emailController.text.trim(),
                                        pNumber: pNumController.text.trim(),
                                        password: passwordController.text.trim(),
                                        cPassword: cPasswordController.text.trim(),
                                        context: context
                                    );

                                  }
                                }, child: Text("Sign Up")),
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account?"),
                                SizedBox(
                                  width: 0.w,
                                ),
                                TextButton(
                                    onPressed: ()
                                    {
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (context) => ConsultLogin(),
                                      ));
                                    },
                                    child: Text("Sign In",style: TextStyle(fontSize: 15.0.sp),))
                              ],
                            ),
                          )
                        ]
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}


