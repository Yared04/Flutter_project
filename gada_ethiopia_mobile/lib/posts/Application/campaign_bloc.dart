import 'package:bloc/bloc.dart';
import 'bloc.dart';
import '../posts.dart';
import 'package:gada_ethiopia_mobile/lib.dart';

import '../infrastructure/post_repo.dart';
class CampaignBloc extends Bloc<CampaignEvent, CampaignState> {
  final PostRepository postRepository;

  CampaignBloc({required this.postRepository}) : super(Idle()) {
    on<CreatePost>(_createcampaign);
    on<PickImage>(_showImage);
  }

  //
  void _createcampaign(CreatePost event, Emitter emit) async {
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
        image: event.image);
    var post = null;
    try {
      post = await postRepository.createPost(instance);
    } catch (e) {
      // print(e);
      emit(CreateFailed());
    }
    if (post != null) {
      emit(CreateSuccess());
    }
  }

  void _showImage(PickImage event, Emitter emit) {
    if (event.image != null) {
      emit(PickSuccess());
    } else {
      emit(PickFail());
    }
  }
}
