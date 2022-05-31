import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Post extends Equatable {
  final int? id;
  final String title;
  final String description;
  final int goal;
  final File? image;
  final int? donated;
  final int? donator_count;
  final int? created;
  Post(
      { this.id,
      required this.title,
      required this.description,
      required this.goal,
      required this.image,
      this.donated,
      this.created,
      this.donator_count});

  @override
  String toString() =>
      'Course { id: $id, title: $title, description: $description , donated : $donated , donator_count : $donator_count, created : $created, image : $image }';

  @override
  List<Object?> get props =>
      [id, title, description, goal, image, donated, donator_count, created];
}
