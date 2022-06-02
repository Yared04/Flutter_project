import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/lib.dart';

import 'package:gada_ethiopia_mobile/widgets/home.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var launch = BlocProvider.of<CampaignBloc>(context);
    // launch.add(GetPosts());
    var myListDict = [];
    List<MyContainer> postsList = [];

    return Scaffold(
      drawer: const MyDrawer(),
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
              icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/profile_picture.jpg'),
            maxRadius: 20,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<CampaignBloc, CampaignState>(
            listener: ((_, state) {}),
            builder: (_, state) {
              if (state is LoadingHome) {
                var launch = BlocProvider.of<CampaignBloc>(context);
                launch.add(GetPosts());
              }
              if (state is LoadFailed) {
                return Center(
                  child: Image(image: AssetImage('assets/ngoImage.png')),
                );
              }
              if (state is LoadSuccess) {
                for (var post in state.posts) {
                  postsList.add(MyContainer(
                      pic: post.image,
                      goal: post.goal,
                      raised: post.donated,
                      created: post.created,
                      donatorCount: post.donator_count,
                      title: post.title));
                  myListDict.add(post);
                }
                myListDict = myListDict.reversed.toList();

                // postsList = MyContainer(pic: pic, goal: goal, raised: raised, category: category, created: created, donatorCount: donatorCount, title: title);
                return Column(children: [
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'User, Welcome to Gada',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 4, 4, 4),
                    child: Text(
                      'Trending Campaigns',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    width: double.maxFinite,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: myListDict.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 300,
                                width: 250,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "http://192.168.56.1:3000/images/uploaded/${myListDict[index].image.uri.toString().split("/").last}"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text('Total Raised'),
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        myListDict[index].donated.toString() +
                                            ' birr(' +
                                            ((myListDict[index].donated! /
                                                        myListDict[index]
                                                            .goal) *
                                                    100)
                                                .floor()
                                                .toString() +
                                            '%)',
                                        style: TextStyle(
                                            color: Colors.green[700],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'All Campaigns',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: postsList,
                  )
                ]);
              } else {
                return Container(
                  height: 500,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            }),
      ),
    );
  }
}
