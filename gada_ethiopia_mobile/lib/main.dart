
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/lib.dart';
import 'package:gada_ethiopia_mobile/posts/data_provider/post_data_provider.dart';
import 'package:gada_ethiopia_mobile/posts/repo/post_repo.dart';
import 'package:gada_ethiopia_mobile/posts/screens/post_detail.dart';
import 'package:http/http.dart';
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
              PostRepository(dataProvider: PostDataProvider(client: Client()))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gada Ethipoia',
       home: CreateCampaign(),
        // home: MyHomePage(),
      ),
    );
  }
}
