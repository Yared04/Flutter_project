import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:image_picker/image_picker.dart';
import 'package:gada_ethiopia_mobile/lib.dart';

import '../../application/auth/login/shared_preferences.dart';


class UpdateCampaign extends StatelessWidget {
  final SharedPreference sharedPreference = SharedPreference();
  final int? id;
  UpdateCampaign({Key? key, this.id}) : super(key: key);

  final form_key = GlobalKey<FormState>();
  final title_ct = TextEditingController();

  final description_ct = TextEditingController();
  final goal_ct = TextEditingController();
  final account_ct = TextEditingController();
  File? uploaded;



 
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CampaignBloc>(context).add(GetCampaignEvent(id: id!));

    return Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.drafts),
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
          // backgroundColor: Color.fromARGB(68, 255, 255, 255),
          // title: Text("ጋዳ"),
          // centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: MySearchDelegete());
                },
                // if(await jsonDecode(sharedPreference.getCatch().toString())['is_staff'] == true){}
                icon: const Icon(Icons.search)),
            IconButton(
              onPressed: () async {
                var obj = await sharedPreference.getCatch();
                if (obj != null) {
                  // var mem = (jsonDecode());
                  var mem = json.decode(obj.toString());

                  print(mem);
                  if (await sharedPreference.isEmpty()) {
                    return null;
                  }
                  if (mem["is_client"] == true || mem["is_admin"] == true) {
                    context.pushNamed('create-post');
                  } else {
                    context.pushNamed('login');
                  }
                }
              },
              icon: Icon(Icons.add),
            ),
            GestureDetector(
              onTap: () async {
                if (await sharedPreference.isEmpty()) {
                  context.push('/login');
                } else {
                  context.push('/profile');
                }
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/profile_picture.jpg'),
                maxRadius: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        // floatingActionButton: FloatingActionButton(onPressed: () {}) ,
        //   final posts3 = {
        //   'pic': 'profile_picture.jpg',
        //   'goal': 1000000,
        //   'raised': 40000,
        //   'title': 'fund the NGO',
        //   // 'category': 'NGO',
        //   'donatorCount': 37888,
        //   'created': '40 days'
        // };
        body: BlocConsumer(
          listener: (_,__) {},
          builder: (BuildContext context, Object? state) {
          
            Widget scafoldBody;
            if (state is LoadingPost) {
              scafoldBody = CircularProgressIndicator();
            }
            if (state is! LoadingPost && state is! LoadPostFailed) {
              state = state as LoadPostSuccessfull;
              String previousTitle = state.post.title;
              String previousDescription = state.post.description;
              int previousGoal = state.post.goal;
              File uploaded = state.post.image;

              scafoldBody = Center(
                child: Form(
                  key: form_key,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: previousTitle,
                            controller: title_ct,
                            decoration: const InputDecoration(
                                hintText: "Title",
                                focusColor: Colors.green,
                                prefixIcon: Icon(Icons.title_sharp),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                            validator: (String? title) {
                              if (title == null || title.isEmpty) {
                                return "Title is required!";
                              }
                              if (title.length > 100) {
                                return "Title Must be less than 100 characters!";
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            initialValue: previousDescription,
                            controller: description_ct,
                            decoration: const InputDecoration(
                              hintText: "Description",
                              focusColor: Colors.green,
                              // prefixIcon: Icon(Icons.title_sharp),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            minLines: 6,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            validator: (String? desc) {
                              if (desc == null || desc.isEmpty) {
                                return "Description is required!";
                              }
                              if (desc.length < 10) {
                                return "Minimum discription lengt of 10 letters!";
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: goal_ct,
                            initialValue: previousGoal.toString(),
                            decoration: const InputDecoration(
                                hintText: "Goal",
                                focusColor: Colors.green,
                                prefixIcon: Icon(Icons.sports_basketball_sharp),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (String? goal) {
                              if (goal == null || goal.isEmpty) {
                                return "Goal is required!";
                              }
                              if (int.parse(goal) < 50) {
                                return "Minimum amount 50";
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          BlocConsumer<CampaignBloc, CampaignState>(
                            // builder: (_, CampaignState s) => Text("a"),
                            builder: (_, CampaignState state) {
                              Widget buttonState = const Text("Update");
                              Widget imagePlace = const Text("Choose an image");

                              if (state is UpdatingPost) {
                                buttonState = const CircularProgressIndicator(
                                  backgroundColor: Colors.green,
                                  color: Colors.white,
                                  strokeWidth: 3,
                                );
                              }
                              if (state is UpdatePostSuccessfull) {
                                buttonState = const Text('Update Successful');
                              }
                              if (state is UpdatePostFailed) {
                                buttonState = const Text(
                                  "Update Faild retry",
                                );
                              }
                              if (state is PickSuccess || uploaded != null) {
                                imagePlace = Text("image Uploaded $uploaded");
                              }
                              if (state is PickFail) {
                                imagePlace = const Text("Image not uploaded");
                              }
                              return Column(
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      final image = await ImagePicker()
                                          .pickImage(
                                              source: ImageSource.gallery);
                                      if (image == null) {
                                        return;
                                      }
                                      uploaded = File(image.path);
                                      final im = BlocProvider.of<CampaignBloc>(
                                          context);
                                      im.add(
                                          PickImage(image: File(image.path)));
                                    },
                                    icon: const Icon(Icons.image_outlined),
                                    label: imagePlace,
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                    ),
                                    onPressed: () {
                                      if (state is UpdatingPost) {
                                        return;
                                      }

                                      final bool isValid =
                                          form_key.currentState!.validate();
                                      if (isValid) {
                                        final post =
                                            BlocProvider.of<CampaignBloc>(
                                                context);

                                        post.add(UpdateCampaignEvent(
                                            title: title_ct.text,
                                            description: description_ct.text,
                                            goal: int.parse(goal_ct.text),
                                            image: File(uploaded.path)));
                                      } else {
                                        return;
                                      }
                                    },
                                    child: buttonState,
                                  ),
                                ],
                              );
                            },
                            listenWhen: (previous, current) =>
                                (current is UpdatePostSuccessfull),
                            listener: (_, CampaignState state) {
                              context.push('home');
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) => const MyHomePage()));
                            },
                          ),

                          // TextFormField(),
                          // TextFormField(),
                          // TextFormField(),
                          //imagefield
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            if (state == LoadPostFailed) {
              scafoldBody = Center(
                child: Column(children: [
                  Text("Could not load post"),
                  ElevatedButton(onPressed: () {}, 
                  child: Text("Return Home"))
                ]),
              );
            }
            else{
              scafoldBody = Center(
                child: Column(
                  children: [
                    Text("error has occured"),
                    ElevatedButton(onPressed: (){}, 
                    child: Text("Return Home"))
                  ]
                  )
              ,);
            }
            return scafoldBody;
          },
        ));
  }
}
