import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';

class DonationBloc extends Bloc<DonationEvents,DonationStates>{
  DonationBloc() : super(Normal()){
    on<Donate>(onDonate);
  } 

  onDonate(Donate event, Emitter emit)async{
    print(event.CreditCardNumber);
    emit(Donating());
    await Future.delayed(Duration(seconds: 3));


    emit(DonationSuccessfull());
    await Future.delayed(Duration(seconds: 1));
    emit(Normal());

  }
}