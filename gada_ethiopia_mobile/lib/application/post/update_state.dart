import '../../lib.dart';

class UpdateCampaignState extends CampaignState{}

class LoadingPost extends UpdateCampaignState {}

class LoadPostSuccessfull extends UpdateCampaignState {
  final Post post;
  LoadPostSuccessfull({required this.post});
}

class LoadPostFailed extends UpdateCampaignState {}

class UpdatingPost extends UpdateCampaignState{}

class UpdatePostSuccessfull extends UpdateCampaignState{}

class UpdatePostFailed extends UpdateCampaignState{}