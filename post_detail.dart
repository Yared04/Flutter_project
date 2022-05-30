import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gada/nav_item.dart';
import 'package:percent_indicator/percent_indicator.dart';
class Gada extends StatelessWidget {
  const Gada({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gada',
      home: PostDetail(),
    );
  }
}
class PostDetail extends StatefulWidget {
  const PostDetail({Key? key}) : super(key: key);

  @override
  State<PostDetail> createState() => _PostDetailState();
  
  }
  class _PostDetailState extends State<PostDetail>{
  bool isReadmore = false;
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PostDetail"),
      // leading: Padding(padding: EdgeInsets.only(left:10),
      // child: GestureDetector(
      //   onTap: () {

      //   },
      //   child: Icon(Icons.arrow_back)),),
      backgroundColor: Colors.white,
      foregroundColor: Colors.green,
      actions: <Widget>[
        Padding(padding: EdgeInsets.only(right:10),
        child: GestureDetector(
          child: Icon(Icons.favorite_outline_rounded),
          onTap:() {}, ),),
          Padding(padding: EdgeInsets.only(right:10),
          child: GestureDetector(
            child: Icon(Icons.more_vert),
            onTap: (){},
          ),)
      ],),
      drawer: Drawer(child: ListView(
        children: [
          Container(
                  width: 17,
                  height:150,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: new DecorationImage(image: AssetImage("assets/images.jpeg"),
                    fit:BoxFit.cover)
                  ),
                 
                ),  
          Divider(),
          NavItem(title: "one", icon: Icons.abc_rounded, widget: widget),
          NavItem(title: "two", icon: Icons.account_balance_sharp, widget: widget),
          NavItem(title: "Profile", icon: Icons.person, widget: widget),
          NavItem(title: "Log Out", icon: Icons.logout, widget: widget)

        ],)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top:20, bottom: 10, left:15, right:15),
          child: Column(children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height:200,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: new DecorationImage(image: AssetImage("assets/images.jpeg"),
                    fit:BoxFit.cover)
                  ),
                 
                ),              
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [Icon(Icons.info_rounded, color: Colors.white,),
                    SizedBox(width: 6,),
                    Text("Created 3 days ago.", style: TextStyle(color: Colors.white),)])
                )
              ],
            ),
            Align(
              heightFactor: 2,
              alignment:Alignment.centerLeft,
              child: Text("Help these people move.",
               style:TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
            Align(
              alignment: Alignment.centerLeft,
              heightFactor: 2,
              child: Text("20 people donated so far.",
              style:TextStyle(fontSize: 13, color: Colors.green),)),
            new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 40,
                animation: true,
                lineHeight: 15.0,
                animationDuration: 2500,
                percent: 0.8,
                center: Text("80.0%"),
                barRadius: Radius.circular(10),
                progressColor: Colors.green,
              ),
                          
            Padding(
              padding: EdgeInsets.only(top:10, bottom:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                Padding(
                  padding: EdgeInsets.only(right:20),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images.jpeg"),
                  )), 
                Column(
                   children: [
                    Text("MOnika Islam"),
                    SizedBox(height: 5),
                    Text("Dhaka Organir", style: TextStyle(color: Colors.grey),)
                  ],
                )
              ],
              
            ),
            Column(
              children:[ Align(
                heightFactor: 3,
                alignment:Alignment.centerLeft,
                child: Text("Description", style:TextStyle(color: Colors.green))),
                
                buildText("Lorem ipsumLorem ipsumLorem Lorem ipsumLorem ipsumLorem ipsumipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum"),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    onPrimary: Colors.green,
                  ),
                  onPressed: (){
                  setState((){
                    isReadmore = !isReadmore;
                  });
                }, child: Text((isReadmore? 'Read Less': 'Read More')),)
          ]),
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              fixedSize: Size(1000, 40),
            ),
            onPressed: (){}, 
            child: Text("Donate Now", 
            style: TextStyle(color: Colors.white, fontSize: 20),)),
                  
          ],),
        ),
      ),
    );
    
   }
            Widget buildText(String text){
              // if read more is false then show only 3 lines from text
              // else show full text
              final lines = isReadmore ? null : 3;
              return Text(
                text,
                style: TextStyle(),
                maxLines: lines,
                // overflow pbuildText("Lorem ipsumLorem ipsumLorem Lorem ipsumLorem ipsumLorem ipsumipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum")roperties is used to show 3 dot in text widget
                // so that user can understand there are few more line to read.
                overflow: isReadmore ? TextOverflow.visible: TextOverflow.ellipsis,
              );
  }
    
      }


    