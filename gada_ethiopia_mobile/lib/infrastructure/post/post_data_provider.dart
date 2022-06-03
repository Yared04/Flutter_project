import 'dart:convert';
import 'package:gada_ethiopia_mobile/domain/post/post_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


class PostDataProvider {
  final _baseUri = 'http://10.5.232.114:3000/';
  final Client client;
  final MultipartRequest request;

  PostDataProvider({required this.request, required this.client});

  Future<Post?> createPost(Post post) async {
    // final uri = Uri.parse(_baseUri);
    // var request = MultipartRequest("POST", uri);
    request.fields.addAll({
      'title': post.title,
      'description': post.description,
      'goal': post.goal.toString(),
      'created': DateTime.now().toString(),
    });
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      //authorization reque
    });
    print(post.image.path);
    request.files.add(await http.MultipartFile.fromPath("image", post.image.path));

    print('passed it');
    var response = await request.send();
    print(response);
    if (response.statusCode == 201) {
      return post;
    } else {
      throw Exception('Failed to create Post.');
    }
  }

  Future<Post> getPostDetail(int id) async{
    final response = await client.get(Uri.http(_baseUri, 'posts/$id'));
    if(response.statusCode == 200){
      final post = jsonDecode(response.body);
      return Post.fromJson(post);
    }
    else{
      throw Exception('Post not found.');
    }

  }

  Future<List<Post>> getPosts() async {
    var response = await get(Uri.parse("${_baseUri}posts"), headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });

    print(response.statusCode);
    if (response.statusCode == 200) {
      print('inside');
      final posts = jsonDecode(response.body) as List;
      List<Post> ret = [];

      for (var post in posts) {
        ret.add(Post.fromJson(post));
      }

      return ret;
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<void> deletePost(int id) async {
    final res = await client.delete(
      Uri.parse('$_baseUri/post-detail/$id'),
      headers: <String, String>{
        'Type': 'application/json; charset = UTF-8',
      },
    );
    if (res.statusCode != 204) {
      throw Exception('Failed');
    }
  }

  Future<Post?> getPostByUserId(int id) async {
    final response = await client.get(Uri.parse("${_baseUri}posts/user/$id"));
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}
