import 'package:consultation_gp/layout/mentor/mentor_layout/mentor_layout.dart';
import 'package:consultation_gp/modules/login/forgot_password/forgot_password.dart';
import 'package:consultation_gp/modules/login/login_cubit/login_cubit.dart';
import 'package:consultation_gp/modules/login/login_cubit/login_states.dart';
import 'package:consultation_gp/modules/mentee/mentee_profile.dart';
import 'package:consultation_gp/modules/mentee/mentee_reg/mentee_reg.dart';
import 'package:consultation_gp/modules/mentee/mentor_exploration/mentor_explore.dart';
import 'package:consultation_gp/modules/mentor/mentor_reg/register_screen/mentor_reg.dart';
import 'package:consultation_gp/modules/mentor/profile_setup/profile_setup.dart';
import 'package:consultation_gp/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sliding_switch/sliding_switch.dart';


class ConsultLogin extends StatelessWidget {


  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state)
        {
          /*if(state is LoginSuccessState)
            {
             if(state.loginModel.success==true)
             {
              if(LoginCubit.get(context).isMentor)
              {
               CacheHelper.saveData(key: 'token', value: state.loginModel.token.toString()).then((value)
               {
               Navigator.pushReplacement(context,
               MaterialPageRoute(builder: (context) => ExploreMentor()));
               });
              }
              else
              {
                CacheHelper.saveData(key: 'token', value: state.loginModel.token).then((value) => {
                Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MentorLayout()))
                });

              }
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
              fontSize: 20.0.sp,
              );
              }
          }*/
        },
        builder: (context,state)
        {
          return Scaffold(

            body: Form(
              key: _formKey,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                                color: Colors.blue
                              ),
                              "Welcome to MentorQuest"),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/45,),
                        Center(
                          child: Text(
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: Colors.grey[500]
                              ),
                              "Login as"),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/45,),
                        Center(
                          child: SlidingSwitch(
                            value: LoginCubit.get(context).isMentor,
                            onChanged: (bool value) {
                              LoginCubit.get(context).toggleLogin();
                            },
                            onSwipe: () {},
                            onTap: () {},
                            onDoubleTap: () {},
                            textOff: 'Mentor',
                            textOn: 'Client',
                            colorOff: Colors.blue,
                            colorOn: Colors.blue,
                            animationDuration: const Duration(milliseconds: 300),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/15,),
                        Padding(
                          padding:  EdgeInsets.all(8.0.w),
                          child: TextFormField(

                            controller: emailController,
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
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an email';
                              }
                              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return 'Please enter a valid Email';
                              }
                              return null;
                            },
                            onSaved: (value) => _email = value!,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/20,),
                        Padding(
                          padding:  EdgeInsets.all(8.0.w),
                          child: TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a password';
                              }
                              return null;
                            },
                            onSaved: (value) => _password = value!,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              labelText: "Password",
                              hintText: "enter your Password",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(
                                Icons.password,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  LoginCubit.get(context).obscureLogin();
                                },
                                icon: LoginCubit.get(context).isOb ? Icon(Icons.visibility_off) : Icon(Icons
                                    .visibility),
                              ),
                            ),
                            obscureText: LoginCubit.get(context).isOb,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/15,),
                        Container
                          (
                          padding:EdgeInsets.only(left: 8.0.w,right: 8.0.w) ,
                          width: double.infinity.w,
                          height: 50.0.h,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate())
                                {
                                  _formKey.currentState!.save();
                                  print(' Email: $_email, Password: $_password');
                                  if(LoginCubit.get(context).isMentor)
                                  {
                                    LoginCubit.get(context).clientLogin(
                                        email:emailController.text.trim(),
                                        password:passwordController.text.trim(),
                                        context: context
                                    );
                                  }
                                  else
                                  {
                                    LoginCubit.get(context).mentorLogin(
                                        email:emailController.text.trim(),
                                        password:passwordController.text.trim(),
                                        context: context,
                                    );

                                  }
                                }
                              },
                              child: Text("Login",
                                style: TextStyle
                                  (
                                  fontSize: 20.0.sp, fontWeight: FontWeight.w500
                                  ),
                              )
                          ),
                        ),
                        /*Center(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ConsultRegister(),
                              ));
                            },
                            child: Text("Sign Up")),
                      ),*/
                        SizedBox(height: MediaQuery.of(context).size.height/55,),
                        Center(
                          child: TextButton(onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ForgotPassword(),));
                          }, child: Text(
                            "Forgot password ?",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17.0.sp,
                                color: Colors.black
                            ),
                          )
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/55,),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1.0.h,
                                width: double.infinity.w,
                                color: Colors.black,
                              ),
                            ),
                            Center(
                                child:
                                Text('   OR   ',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[500]),
                                )
                            ),
                            Expanded(
                              child: Container(
                                height: 1.0.h,
                                width: double.infinity.w,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/55,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account ?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.0.sp,
                                  color: Colors.black
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  LoginCubit.get(context).isMentor?Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ConsultRegister(),)):Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MentorReg(),));
                                },
                                child: Text(
                                  "Register now ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17.0.sp,
                                      color: Colors.blue
                                  ),
                                )
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


}



/*if(state is LoginSuccessState)
{
if(state.loginModel.success!)
{
if(LoginCubit.get(context).isMentor)
{
Navigator.pushReplacement(context,
MaterialPageRoute(builder: (context) => MenteeProfile()));
}
else
{
Navigator.pushReplacement(context,
MaterialPageRoute(builder: (context) => ProfileSetup()));
}
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