import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/Admin/Screens/list_of_posts.dart';
import 'package:gada_ethiopia_mobile/lib.dart';
import 'package:gada_ethiopia_mobile/posts/screens/post_detail.dart';

void main() {
  runApp( const Gada());
  
}

class Gada extends StatelessWidget {
   const Gada({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ( _ ) => CampaignBloc(),

      child:
       MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gada Ethipoia',
      home: listPosts(),
      // home: MyHomePage(),

    ),
    );
  }
}