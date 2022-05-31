import 'dart:io';
import 'package:http/http.dart';
import 'package:gada_ethiopia_mobile/lib.dart';

class PostDataProvider {
  final _baseUri = 'http://127.0.0.1:8000/';
  final Client client;

  PostDataProvider({required this.client});

  Future<Post?> createPost(Post post) async {
    final uri = Uri.parse("${_baseUri}posts");
    var request = MultipartRequest("POST", uri);
    request.fields.addAll({
      'title': post.title,
      'description': post.description,
      'goal': post.goal.toString()
    });
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      //authorization reque
    });
    print( post.image!.path);
    request.files.add(await MultipartFile.fromPath(
        "image", 
        post.image!.path
        ));

    print('passed it');
    var response = await request.send();
    print(response);
    if (response.statusCode == 200) {
      return post;
    } else {
      throw Exception('Failed to create Post.');
    }

    // final httpImage = MultipartFile.fromBytes('files.myimage', bytes,
    //       contentType: MediaType.parse(mimeType), filename: 'myImage.png');

    // final response = await client.post(Uri.http('127.0.0.1:8000/', 'posts'),
    //     headers: {
    //       'Content-Type': 'multipart/form-data ; charset=UTF-8',
    //     },
    //     body: jsonEncode({
    //       'title': post.title,
    //       'description': post.description,
    //       'image': post.image,
    //       'goal': post.goal
    //     }));
    // return null ;
  }
}
