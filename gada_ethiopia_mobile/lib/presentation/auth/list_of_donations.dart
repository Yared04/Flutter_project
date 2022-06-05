
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../application/auth/login/shared_preferences.dart';
import '../../lib.dart';


class ListDonations extends StatelessWidget {
  
 ListDonations({Key? key}) : super(key: key);
  final SharedPreference sharedPreference = SharedPreference();
  Widget _buildPopup(BuildContext context, id) {
  return  AlertDialog(
    title: const Text('Delete donation'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
         Text("Are you sure you want to delete this donation?"),
      ],
    ),
    actions: [
       TextButton(
        onPressed: () {
         context.read<AdminBloc>().add(DeletePost(id));
        },
        child: const Text('Yes'),
      ),
      TextButton(
        onPressed: (){
          // Navigator.of(context).pop();
      },
       child: const Text("No"))
    ],
  );
}

  @override
  Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.drafts),
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: Colors.black,
          // backgroundColor: Color.fromARGB(68, 255, 255, 255),
          title: Text("list of donations"),
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
        body: BlocBuilder<AdminBloc, AdminState>(
        builder:(_, state){
          if(state is PostLoadFailure){
            return const Text("Failed.");
          }
          if(state is PostLoaded){
            final posts = state.posts;
        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: posts.length,
          itemBuilder: (context, index) => 
            Card(
              child: ListTile(
              onTap: () {
            
                },
              subtitle: Text("Amount: ${posts[index].goal}"),
              trailing: GestureDetector(
                child: const Icon(Icons.delete,),
                onTap: (){
                showDialog(
                context: context,
                builder: (_) => _buildPopup(context, posts[index].id));
                },),
              title: Text(posts[index].title)),
          ),
             
          );
          }
          return Center(child: const CircularProgressIndicator());
        }
        
    )
    
  );
}
      
}
