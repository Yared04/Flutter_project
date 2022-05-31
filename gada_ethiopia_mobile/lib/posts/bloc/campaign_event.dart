import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class CampaignEvent {}

class CreatePost extends CampaignEvent {
  final String title;
  final String thyme;
  final String description;
  final int goal;
  
  File? image;
  CreatePost(
      {required this.title,
      required this.thyme,
      required this.description,
      required this.goal,
      this.image});
}

class PickImage extends CampaignEvent {
  final XFile? image;
  PickImage({required this.image});
}
