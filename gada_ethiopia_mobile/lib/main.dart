
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/infrastructure/post/post_data_provider.dart';
import 'package:gada_ethiopia_mobile/infrastructure/post/post_repo.dart';
// import 'package:gada_ethiopia_mobile/Admin/presentation/list_of_users.dart';
// import 'package:gada_ethiopia_mobile/Admin/presentation/list_of_posts.dart';
// import 'package:gada_ethiopia_mobile/posts/infrastructure/post_data_provider.dart';
// import 'package:gada_ethiopia_mobile/posts/infrastructure/post_repo.dart';
// import 'package:gada_ethiopia_mobile/posts/presentation/pages/post_detail.dart';
import 'package:http/http.dart';

import 'application/post/post.dart';
import 'presentation/post/post_detail.dart';
// import 'package:gada_ethiopia_mobile/posts/screens/post_detail.dart';

void main() {
  runApp(const Gada());
}

class Gada extends StatelessWidget {
  const Gada({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (_) => CampaignBloc(
          postRepository:
              PostRepository(dataProvider: PostDataProvider(request: MultipartRequest("Post" ,Uri.parse('http://192.168.56.1:3000/posts') ) ,client: Client()))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gada Ethipoia',
       home: PostDetail(),
        // home: MyHomePage(),
      ),
    );
  }
}
