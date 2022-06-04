import 'package:bloc/bloc.dart';
import 'post.dart';
import 'package:gada_ethiopia_mobile/lib.dart';

class CampaignBloc extends Bloc<CampaignEvent, CampaignState> {
  final PostRepository postRepository;

  CampaignBloc({required this.postRepository}) : super(LoadingHome()) {
    on<CampaignEvent>(_createcampaign);
  }

  void _createcampaign(CampaignEvent event, Emitter emit) async {
  
    if (event is GetCampaignEvent) {
      emit(LoadingPost());
      try {
        final post = await postRepository.getPostDetail(event.id);
        emit(LoadPostSuccessfull(post: post));
      } catch (e) {
        emit(LoadPostFailed());
      }
    }


    if(event is UpdateCampaignEvent){
      emit(UpdatingPost());
      await Future.delayed(Duration(seconds: 1));

      final instance = Post(
          description: event.description,
          title: event.title,
          goal: event.goal,
          image: event.image,
          created: DateTime.now());
      var post = null;
      try {
        post = await postRepository.updatePost;
      } catch (e) {
        print(e);
        emit(UpdatePostFailed());
      }
      if (post != null) {
        emit(UpdatePostSuccessfull());
      }
    }

    if (event is CreatePost) {
      // print(event.title);
      // print(event.goal);
      if (event.image == null) {
        emit(CreateFailed());
        return;
      }
      emit(CreatingPost());
      await Future.delayed(Duration(seconds: 1));

      final instance = Post(
          description: event.description,
          title: event.title,
          goal: event.goal,
          image: event.image,
          created: DateTime.now());
      var post = null;
      try {
        post = await postRepository.createPost(instance);
      } catch (e) {
        print(e);
        emit(CreateFailed());
      }
      if (post != null) {
        emit(CreateSuccess());
      }
    }
    if (event is PickImage) {
      if (event.image != null) {
        emit(PickSuccess());
      } else {
        emit(PickFail());
      }
    }

    if (event is GetPosts) {
      // print("been here");
      var posts = null;
      try {
        posts = await postRepository.getPosts();
      } catch (e) {
        // print("failed?");
        emit(LoadFailed());
      }
      if (posts != null) {
        // print(posts.toString());
        emit(LoadSuccess(posts: posts));
      }
    }
  }
}
  
