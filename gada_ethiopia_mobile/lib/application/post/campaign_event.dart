import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class CampaignEvent {}

class CreatePost extends CampaignEvent {
  final String title;
  final String description;
  final int goal;
  
  File image;
  CreatePost(
      {required this.title,
      required this.description,
      required this.goal,
      required this.image});
}

class PickImage extends CampaignEvent {
  final File image;
  PickImage({required this.image});
}
class GetPosts extends CampaignEvent {}

class FindPost extends CampaignEvent {
  int id;
  FindPost({required this.id});
}