import 'package:consultation_gp/models/login/login_model.dart';

abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates
{
  final ConsultLoginModel loginModel;

  RegisterSuccessState(this.loginModel);
}

class RegisterErrorState extends RegisterStates
{
  /*final String error;

  RegisterErrorState(this.error);*/}

class RegisterObscureState extends RegisterStates{}


