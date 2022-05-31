import 'package:bloc/bloc.dart';
import '../admin.dart';


class AdminBloc extends Bloc<AdminEvents, AdminState> {
  AdminBloc() : super(Idle()) {
    on<Confirmation>(_confirm);
  }
  void _confirm(Confirmation event, Emitter emit){
      if(event.sure == true){
        emit(DeleteSuccess());
      }
      else{
        emit(DeleteFailure());
      }
  }

}