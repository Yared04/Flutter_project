// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/application/auth/login/bloc.dart';
import 'package:gada_ethiopia_mobile/application/auth/password_bloc.dart';
import 'package:gada_ethiopia_mobile/application/auth/registration/bloc.dart';
import 'package:gada_ethiopia_mobile/infrastructure/post/post_data_provider.dart';
import 'package:gada_ethiopia_mobile/infrastructure/post/post_repo.dart';

import 'package:http/http.dart';
import 'lib.dart';
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
    return MultiBlocProvider(

      providers: [
        BlocProvider(
            create: (BuildContext context) => (CampaignBloc(
                  postRepository: PostRepository(
                    dataProvider: PostDataProvider(
                      request: MultipartRequest(
                          "Post", Uri.parse('http://192.168.56.1:3000/posts')),
                      client: Client(),
                    ),
                  ),
                )),),
        BlocProvider(create: (BuildContext context) => LoginBloc()),
        BlocProvider(create: (BuildContext context) => RegBloc(userRepository: UserRepository(dataProvider:UserDataProvider(client: Client()))))
        
        // BlocProvider(create: (BuildContext context) => PassBloc())
      ],
      
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gada Ethipoia',
          // home: Login(),
          home: Register(),
        ),
  
    );
  }
}
