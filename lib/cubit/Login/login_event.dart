part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginClickEvent extends LoginEvent {
  final String username;
  final String password;

  LoginClickEvent({
    required this.username,
    required this.password,
  });
}