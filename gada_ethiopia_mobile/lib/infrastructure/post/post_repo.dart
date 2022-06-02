

import 'package:gada_ethiopia_mobile/domain/post/post_model.dart';

import 'data_provider.dart';

class PostRepository {
  final PostDataProvider dataProvider;

  PostRepository({required this.dataProvider});

  Future<Post?> createPost(Post post) async {
    return await dataProvider.createPost(post);
  }
  Future<List<Post>?> getPosts() async {
    return await dataProvider.getPosts();
  }
  Future<void> deletePost(int id) async{
    return await dataProvider.deletePost(id);
  }

}