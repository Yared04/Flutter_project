import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/application/auth/login/shared_preferences.dart';

import '../../../domain/auth/user_model.dart';
import '../../../infrastructure/auth/data_provider.dart';
import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SharedPreference sharedPreference = SharedPreference();
  UserRepository userRepository;
  LoginBloc({required this.userRepository}) : super(NoAttempt()) {
    on<LoginEvent>(_loginAttempt);
  }

  void _loginAttempt(LoginEvent event, Emitter emit) async {
    emit(Logingin());
    User user =
        User(first_name: '', email: event.email, password: event.password);

    var res = null;
    try {
      res = await userRepository.searchUser(user);
    } catch (e) {
      emit(LoginFailed());
    }
    if (res == null) {
      emit(LoginFailed());
    } else {
      print(res);
      sharedPreference.createCatch(event.email);
      emit(LoginSuccesful());
    }
  }
}
