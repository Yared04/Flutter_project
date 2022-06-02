import 'package:meta/meta.dart';
import 'package:gada_ethiopia_mobile/lib.dart';
import 'package:gada_ethiopia_mobile/posts/infrastructure/post_data_provider.dart';

import '../domain/models.dart';

class PostRepository {
  final PostDataProvider dataProvider;

  PostRepository({required this.dataProvider});

  Future<Post?> createPost(Post post) async {
    return await dataProvider.createPost(post);
  }
  Future<List<Post>?> getPost() async {
    return await dataProvider.getPost();
  }
  Future<void> deletePost(int id) async{
    return await dataProvider.deletePost(id);
  }

}