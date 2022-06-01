import 'package:flutter/material.dart';
import 'package:gada_ethiopia_mobile/lib.dart';

import 'package:gada_ethiopia_mobile/widgets/home.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts1 = {
      'pic': 'profile_picture.jpg',
      'goal': 78009,
      'raised': 56100,
      'title': 'fund for education',
      // 'category': 'Education',
      'donatorCount': 1746,
      'created': '3 days'
    };
    final posts2 = {
      'pic': 'profile_picture.jpg',
      'goal': 13400,
      'raised': 8000,
      'title': 'fund the poor',
      // 'category': 'Creative Ideas',
      'donatorCount': 100,
      'created': '3 days'
    };
    final posts3 = {
      'pic': 'profile_picture.jpg',
      'goal': 1000000,
      'raised': 40000,
      'title': 'fund the NGO',
      // 'category': 'NGO',
      'donatorCount': 37888,
      'created': '40 days'
    };
    var myListDict = [posts1, posts2, posts3];
    List<MyContainer> postsList = [];
    for (var item in myListDict) {
      var instance = MyContainer(
          pic: item['pic'].toString(),
          goal: int.parse(item['goal'].toString()),
          raised: int.parse(item['raised'].toString()),
          category: item['category'].toString(),
          created: item['created'].toString(),
          donatorCount: int.parse(item['donatorCount'].toString()),
          title: item['title'].toString());
      postsList.add(instance);
    }
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
        child: Column(
          children: [
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 350,
              width: double.maxFinite,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 3,
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
                            image: const DecorationImage(
                              image: AssetImage('assets/profile_picture.jpg'),
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
                                  '100,000 birr/ 83%',
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
            //this is categories
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
            //   child: Text(
            //     'Categories',
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // Container(
            //   height: 120,
            //   width: double.maxFinite,
            //   child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: category.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Column(
            //           children: [
            //             Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Container(
            //                   width: 80,
            //                   height: 80,
            //                   decoration: BoxDecoration(
            //                     image: DecorationImage(
            //                         image: AssetImage('assets/' +
            //                             category.values
            //                                 .elementAt(index)
            //                                 .toString()),
            //                         fit: BoxFit.cover),
            //                   ),
            //                 )),
            //             Text(
            //               category.keys.elementAt(index).toString(),
            //               style: TextStyle(fontWeight: FontWeight.bold),
            //             ),
            //           ],
            //         );
            //       }),
            // ),
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

            // List of campaigns with the specified category
          ],
        ),
      ),
    );
  }
}
