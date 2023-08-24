import 'package:bloc/bloc.dart';
import 'package:consultation_gp/layout/mentee/mentee_layout/mentee_layout.dart';
import 'package:consultation_gp/layout/mentor/mentor_layout/mentor_layout.dart';
import 'package:consultation_gp/models/login/login_model.dart';
import 'package:consultation_gp/modules/mentor/mentor_reg/register_cubit/register_states.dart';
import 'package:consultation_gp/modules/mentor/profile_setup/profile_setup.dart';
import 'package:consultation_gp/network/local/cache_helper.dart';
import 'package:consultation_gp/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit (): super(RegisterInitialState());

static RegisterCubit get(context) => BlocProvider.of(context);


late ConsultLoginModel loginModel;
bool isOb= true;



void obscureRegister()
{
  isOb= !isOb;
  emit(RegisterObscureState());
}



void mentorRegister({
  required String fName,
  required String lName,
  required String email,
  required String pNumber,
  required String password,
  required String cPassword,
  required BuildContext context

})
{
  emit(RegisterLoadingState());
 DioHelper.postData(
    url: '/mentor/register',
    data:
    {
      'fname': fName,
      'lname':lName,
      'email':email,
      'phone':pNumber,
      'password':password,
      'password_confirmation':cPassword,

    }).then((value)
{
  loginModel=ConsultLoginModel.fromJson(value.data);
  if(loginModel.success==true)
  {
    CacheHelper.saveData(key: 'token', value: loginModel.token.toString());
    emit(RegisterSuccessState(loginModel));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => ProfileSetup(),));
    print(loginModel.message);
    print(loginModel.token);
  }
  else if(loginModel.success==false)
  {
    emit(RegisterErrorState(/*loginModel.toString()*/));
    Map<String,dynamic> errors = value.data['errors'];
    errors.forEach((key, value) {
      for (int i = 0; i < value.length; i++) {
        Fluttertoast.showToast(
            msg: value[i],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });
    print(loginModel.message);
    print(loginModel.token);
  }
});
 /*DioHelper.dio.options.headers=
 {
   'Content-Type':'application/json',
   'Accept':'application/json',
 };*/
}


void clientRegister({
  required String fName,
  required String lName,
  required String userName,
  required String pNumber,
  required String email,
  required String password,
  required String cPassword,
  required BuildContext context
})
{
  emit(RegisterLoadingState());

   DioHelper.postData(
      url: '/mentee/register',
      data:
      {
        'fname': fName,
        'lname':lName,
        'username':userName,
        'email':email,
        'phone':pNumber,
        'password':password,
        'password_confirmation':cPassword,
      }).then((value)
  {
    loginModel=ConsultLoginModel.fromJson(value.data);
    if(loginModel.success==true)
    {
      CacheHelper.saveData(key: 'token', value: loginModel.token.toString());
      emit(RegisterSuccessState(loginModel));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MenteeLayout(),));
      print(loginModel.message);
      print(loginModel.token);
    }
    else if(loginModel.success==false)
    {
      emit(RegisterErrorState(/*loginModel.toString()*/));
      Map<String,dynamic> errors = value.data['errors'];
      errors.forEach((key, value) {
        for (int i = 0; i < value.length; i++) {
          Fluttertoast.showToast(
              msg: value[i],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      });
      print(loginModel.message);
      print(loginModel.token);
    }


  });
      /* .catchError((error)
  {
    emit(RegisterErrorState(error));
    print(error.toString());
  });*/
}



}

