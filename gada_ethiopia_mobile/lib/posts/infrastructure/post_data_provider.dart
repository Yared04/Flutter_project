import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:gada_ethiopia_mobile/lib.dart';

class PostDataProvider {
  final _baseUri = 'http://192.168.56.1:3000/posts';
  final http.Client client;
  final http.MultipartRequest request;

  PostDataProvider(this.client,  {required this.request});

  Future<Post?> createPost(Post post) async {
    // final uri = Uri.parse(_baseUri);
    // var request = MultipartRequest("POST", uri);
    request.fields.addAll({
      'title': post.title,
      'description': post.description,
      'goal': post.goal.toString()
    });
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      //authorization reque
    });
    // print(post.image!.path);
    request.files.add(await http.MultipartFile.fromPath("image", post.image!.path));

    // print('passed it');
    var response = await request.send();
    // print(response);
    if (response.statusCode == 201) {
      return post;
    } else {
      throw Exception('Failed to create Post.');
    }
  }

  Future<void> deletePost(int id) async{
    final http.Response res = await client.delete(
    '$_baseUri/posts/$id',
    headers: <String, String>{
      'Type' : 'application/json; charset = UTF-8',
    },
  );
  if(res.statusCode != 204){
    throw Exception('Failed');
  }
  }
}