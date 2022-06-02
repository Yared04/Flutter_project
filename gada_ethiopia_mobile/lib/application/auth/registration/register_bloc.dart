import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';


class RegBloc extends Bloc<RegEvent,RegState>{
  RegBloc(): super(NoAttempt()){
    on<RegEvent>(_registerClicked);
  }

  void _registerClicked(RegEvent event, Emitter emit) async {
    emit(Registration());
    await Future.delayed(const Duration(seconds: 3));
    emit(Registerd());
  }
}