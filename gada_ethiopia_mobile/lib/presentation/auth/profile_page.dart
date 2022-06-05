
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/application/auth/profile/bloc.dart';
import 'package:gada_ethiopia_mobile/lib.dart';
import 'package:gada_ethiopia_mobile/widgets/custom.dart';
import 'package:go_router/go_router.dart';
import 'Information.dart';

class Profile extends StatelessWidget{

  bool isEnabled=false;
  // String profile_name;
  List<Information> details = [
    Information(icon:Icon(Icons.support,color: Colors.purple,) , title: Text("Donation",style: TextStyle(fontSize: 18.7),), goto: "myDonations"),
    //  Information(icon: Icon(Icons.edit_note, color: Colors.purple,) , title: Text("List of Posts",style: TextStyle(fontSize: 18.7),), goto: "ListOfPosts"),
    Information(icon: Icon(Icons.logout, color: Colors.red,) , title:Text( "Logout",style: TextStyle(fontSize: 18.7,color: Colors.red),), goto: "login"),
  ];


  @override
  Widget build(BuildContext context){
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
      // drawer:  const MyDrawer(),
      body: Stack(
      children:<Widget> [ Container(
            decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), ),
          ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 200,),

          Expanded(child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.elliptical(60, 30),topRight: Radius.elliptical(60, 30) ),
              
            ),
          padding: EdgeInsets.only(top: 90),

          child:ListView.builder(itemCount: details.length,
            itemBuilder: (context,index)
            {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)
                ),
                child: ListTile(
                  onTap: (){context.pushNamed(details[index].goto);},
                  title: details[index].title,
                  leading: details[index].icon,
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                ),
              );

            },
          ),          ),
          ),],
      ),

      ),
      
          Positioned(

            top: 135,
           right:MediaQuery.of(context).size.width * (0.5-(60/MediaQuery.of(context).size.width)),
           child:Container(),
          ),
         Positioned(
           top: 260,
           right: 0,
           left:0,
             child: Container(),
                ),
         

        Positioned(
          top: 200,
          right:0,
          left:60,
          child:Container()
        ),
    ],),
    );

  }
}