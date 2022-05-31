import 'package:bloc/bloc.dart';
import '../admin.dart';


class AdminBloc extends Bloc<AdminEvents, AdminState> {
  AdminBloc() : super(Idle()) {
    on<DeletePost>(_confirm);
  }
  void _confirm(DeletePost event, Emitter emit){
    print(event.id);
      // try { awiat da.derl}
      if(event.id != null){
        emit(DeleteSuccess());
        
      }
      else{
        emit(DeleteFailure());
      }
  }

}