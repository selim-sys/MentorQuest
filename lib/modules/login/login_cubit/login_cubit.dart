import 'package:bloc/bloc.dart';
import 'package:consultation_gp/layout/mentee/mentee_layout/mentee_layout.dart';
import 'package:consultation_gp/layout/mentor/mentor_layout/mentor_layout.dart';
import 'package:consultation_gp/models/login/login_model.dart';
import 'package:consultation_gp/modules/login/login_cubit/login_states.dart';
import 'package:consultation_gp/network/local/cache_helper.dart';
import 'package:consultation_gp/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit (): super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);


  late ConsultLoginModel loginModel;
bool isMentor=false;
bool isOb= true;

void toggleLogin()
{
isMentor= !isMentor;
CacheHelper.saveData(key: 'isMentor', value: isMentor);
emit(LoginToggleState());
}

void obscureLogin()
{
  isOb= !isOb;
  emit(LoginObscureState());
}



void mentorLogin({
  required String email,
  required String password,
  required BuildContext context
})
{
  emit(LoginLoadingState());
 DioHelper.postData(
    url: '/mentor/login',
    data:
    {
      'email': email,
      'password':password
    }).then((value)
{
  loginModel=ConsultLoginModel.fromJson(value.data);
  if(loginModel.success==true)
  {
    CacheHelper.saveData(key: 'token', value: loginModel.token.toString());
    emit(LoginSuccessState(loginModel));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => MentorLayout(),));
    print(loginModel.message);
    print(loginModel.token);
  }
  else if(loginModel.success==false)
  {
    emit(LoginErrorState(/*loginModel.toString()*/));
    Fluttertoast.showToast(
      msg: loginModel.message!,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 10,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 20.0,
    );
    print(loginModel.message);
    print(loginModel.token);
  }


});
     /*.*//*catchError((error)
  {
    emit(LoginErrorState(error.toString()));
    print(error.toString());
  });*/
}


void clientLogin({
  required String email,
  required String password,
  required BuildContext context

})
{
  emit(LoginLoadingState());

   DioHelper.postData(
      url: '/mentee/login',
      data:
      {
        'email': email,
        'password':password
      }).then((value)
  {
    loginModel=ConsultLoginModel.fromJson(value.data);
    if(loginModel.success==true)
    {
      CacheHelper.saveData(key: 'token', value: loginModel.token.toString());
      emit(LoginSuccessState(loginModel));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MenteeLayout(),));
      print(loginModel.message);
      print(loginModel.token);
    }
    else if(loginModel.success==false) {
      emit(LoginErrorState());
      Fluttertoast.showToast(
        msg: loginModel.message!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 10,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 20.0,
      );
      print(loginModel.message);
      print(loginModel.token);
    }
  });
       /*.catchError((error)
  {
    emit(LoginErrorState(*//*error*//*));
    print(error.toString());
  });*/
}



}

