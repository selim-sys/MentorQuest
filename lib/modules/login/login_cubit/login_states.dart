import 'package:consultation_gp/models/login/login_model.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates
{
  final ConsultLoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates
{
  /*final String error;

  LoginErrorState(this.error);*/}

class LoginObscureState extends LoginStates{}

class LoginToggleState extends LoginStates{}

