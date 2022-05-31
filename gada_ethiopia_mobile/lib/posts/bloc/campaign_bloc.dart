import 'package:bloc/bloc.dart';
import '../posts.dart';


class CampaignBloc extends Bloc<CampaignEvent, CampaignState> {
  CampaignBloc() : super(Idle()) {
    on<CreatePost>(_createcampaign);
    on<PickImage>(_showImage);
  }
  //
  void _createcampaign(CreatePost event, Emitter emit) async {
    print(event.title);
    print(event.goal);
    emit(CreatingPost());
    await Future.delayed(const Duration(seconds: 5));
    if (event.image != null) {
      emit(CreateSuccess());
    } else {
      emit(CreateFailed());
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
