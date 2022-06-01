class CampaignState {}


class Idle extends CampaignState {}
class CreatingPost extends CampaignState {}
class CreateSuccess extends CampaignState {}

class CreateFailed extends CampaignState {}

class PickingImage extends CampaignState {}
class PickSuccess extends CampaignState {}
class PickFail extends CampaignState {}