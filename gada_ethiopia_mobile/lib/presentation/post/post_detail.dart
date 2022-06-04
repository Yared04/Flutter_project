
import 'package:flutter/material.dart';
import 'package:gada_ethiopia_mobile/lib.dart';
import 'package:go_router/go_router.dart';
// import 'package:percent_indicator/percent_indicator.dart';

import 'screens.dart';

class PostDetail extends StatelessWidget {
  final Post post;
 PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              icon: const Icon(Icons.search)),
          IconButton(onPressed: () {
                        context.pushNamed('create-post');
          }, icon: const Icon(Icons.add)),
          GestureDetector(
            onTap: (){context.pushNamed('profile');},
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
      drawer:  const MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:20, bottom: 10, left:15, right:15),
          child: Column(children: [
            Stack(
              children: [
                Container(
                  // width: MediaQuery.of(context).size.width,
                  height:350,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(image: AssetImage("assets/gada_logo.jpg"),
                    fit:BoxFit.cover)
                  ),
                 
                ),              
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: const [Icon(Icons.info_rounded, color: Colors.white,),
                    SizedBox(width: 6,),
                    Text("Created 3 days ago.", style: TextStyle(color: Colors.white),)])
                )
              ],
            ),
            const Align(
              heightFactor: 2,
              alignment:Alignment.centerLeft,
              child: Text("Help these people move.",
               style:TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
            const Align(
              alignment: Alignment.centerLeft,
              heightFactor: 2,
              child: Text("20 people donated so far.",
              style:TextStyle(fontSize: 13, color: Colors.green),)),
              // LinearPercentIndicator(
              //   width: MediaQuery.of(context).size.width - 40,
              //   animation: true,
              //   lineHeight: 15.0,
              //   animationDuration: 2500,
              //   percent: 0.8,
              //   center: const Text("80.0%"),
              //   barRadius: const Radius.circular(10),
              //   progressColor: Colors.green,
              // ),
                          
            Padding(
              padding: const EdgeInsets.only(top:10, bottom:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Goal: 2000 birr", 
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),),
                  Text("Raised: 1700 birr( 80% )",
                  style: TextStyle(color: Colors.green),)
                ],
              ),
            ),
            const Divider(),
            const Align(
              heightFactor: 2,
              alignment: Alignment.centerLeft,
              child: Text("Organizer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right:20),
                  child: CircleAvatar(
                    child: Icon(Icons.person),
                  )), 
                Column(
                   children: const [
                    Text("MOnika Islam"),
                    SizedBox(height: 5),
                    Text("Dhaka Organir", style: TextStyle(color: Colors.grey),)
                  ],
                )
              ],
              
            ),
            Column(
              children:const [ Align(
                heightFactor: 3,
                alignment:Alignment.centerLeft,
                child: Text("Description", style:TextStyle(color: Colors.green))),
                
                Text("Lorem ipsumLorem ipsumLorem Lorem ipsumLorem ipsumLorem ipsumipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum"),
                
          ]),
          const SizedBox(height: 10,),
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              fixedSize: const Size(1000, 40),
            ),
            onPressed: (){
              context.goNamed('doante',params: {} );
            }, 
            child: const Text("Donate Now", 
            style: TextStyle(color: Colors.white, fontSize: 20),)),
                  
          ],),
        ),
      ),
    );
  }
}




    