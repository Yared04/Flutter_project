import 'package:bloc/bloc.dart';
// import 'package:flutter/foundation.dart';
import 'package:gada_ethiopia_mobile/lib.dart';
// import '../../Auth/infrastructure/data_provider.dart';
import 'admin.dart';

class AdminBloc extends Bloc<AdminEvents, AdminState> {
  final PostRepository postRepo;
  final UserRepository userRepo;

  AdminBloc({required this.postRepo, required this.userRepo})
      : super(Loading()) {
    on<LoadPost>(_loading_posts);
    on<DeletePost>(_delete_post);
    on<LoadUsers>(_loading_users);
    on<DeleteUser>(_delete_user);
  }

  void _delete_user(DeleteUser event, Emitter emit) async {
    try {
      await userRepo.deleteUser(event.id);
      final users = await userRepo.getUsers();
      emit(UsersLoaded());
    } catch (_) {
      emit(UsersLoadFailure());
    }
  }

  void _loading_users(LoadUsers event, Emitter emit) async {
    emit(Loading());
    var users;
    try {
      users = await userRepo.getUsers();
    } catch (_) {
      emit(UsersLoadFailure());
    }
    if(users != null){
      emit(UsersLoaded(users));
    }
    else{
      emit(UsersLoadFailure());
    }
  }

  void _loading_posts(LoadPost event, Emitter emit) async {
    emit(Loading());
    var posts;
    try {
      posts = await postRepo.getPosts();
    } catch (_) {
      emit(PostLoadFailure());
    }
    if (posts != null) {
      emit(PostLoaded(posts));
    } else {
      emit(PostLoadFailure());
    }
  }

  void _delete_post(DeletePost event, Emitter emit) async {
    try {
      await postRepo.deletePost(event.id);
    } catch (e) {
      emit(DeleteFailure);
      return;
    }
    emit(DeleteSuccess());
  }
}
