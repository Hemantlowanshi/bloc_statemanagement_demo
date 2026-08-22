part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{}

class LoginSuccess extends LoginState{
  final LoginModel loginModel;
  LoginSuccess(
    this.loginModel
);
  D name
}

class LoginError extends LoginState{

  final String msg;
  LoginError(this.msg);

}