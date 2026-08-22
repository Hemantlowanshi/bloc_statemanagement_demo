import 'package:bloc/bloc.dart';
import 'package:bloc_statemanagement_demo/Models/loginData.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginClickEvent>((event, emit) async {
      emit(LoginLoading());

      try {
        final dio = Dio();

        final response = await dio.post(
          'https://dummyjson.com/auth/login',
          data: {
            'username': event.username,
            'password': event.password,
          },
        );

        print(response.data);

         final LoginModel  user = LoginModel.fromJson(response.data);
        emit(LoginSuccess(user));
      } catch (e) {
        print(e);

        emit(LoginError("Login failed"));
      }
    });
  }
}