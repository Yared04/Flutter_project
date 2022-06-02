import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:gada_ethiopia_mobile/lib.dart';
import '../admin.dart';


class AdminBloc extends Bloc<AdminEvents, AdminState> {

  final PostRepository postRepo;
  final UserRepository userRepo;

  AdminBloc({required this.postRepo, required this.userRepo}) : super(Loading());


  @override
  Stream<AdminState> event_to_state(AdminEvents event) async*{
    if(event is LoadPost){
      yield Loading();
      try{
        final posts =  await postRepo.getPost();
        yield PostLoaded();
      }
      catch(_){
        yield PostLoadFailure();
      }
    }
    if(event is DeletePost){
      try{
        await postRepo.deletePost(event.id);
        final posts = await postRepo.getPost();
        yield PostLoaded();
      }
      catch(_){
        yield PostLoadFailure();
      }


    if(event is LoadUsers){
      yield Loading();
      try{
        final users =  await userRepo.getUsers();
        yield UsersLoaded();
      }
      catch(_){
        yield UsersLoadFailure();
      }
    }
    }
    if(event is DeleteUser){
      try{
        await userRepo.deletePost(event.id);
        final users = await userRepo.getUsers();
        yield UsersLoaded();
      }
      catch(_){
        yield UsersLoadFailure();
      }
    }
    
  }
 
  // void _confirm(DeletePost event, Emitter emit){
  //   print(event.id);
  //     // try { awiat da.derl}
  //     if(event.id != null){
  //       emit(DeleteSuccess());
        
  //     }
  //     else{
  //       emit(DeleteFailure());
  //     }
  // }

}