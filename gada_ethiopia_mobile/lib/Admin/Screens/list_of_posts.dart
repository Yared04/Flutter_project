
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/Admin/bloc/bloc.dart';
import 'package:gada_ethiopia_mobile/lib.dart';
// import 'package:gada_ethiopia_mobile/lib.dart';


class listPosts extends StatelessWidget {
 listPosts({Key? key}) : super(key: key);
  

  Widget _buildPopup(BuildContext context) {
  return  AlertDialog(
    title: const Text('Delete Post'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Are you sure you want to delete this post?"),
      ],
    ),
    actions: [
       TextButton(
        onPressed: () {
                  
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
    // const size = 3;
    // Widget status = 
    List posts = [{"title" : " thet" , "id" : 3},{"title" : " thet" , "id" : 3},{"title" : " thet" , "id" : 3}];
    return BlocConsumer<AdminBloc , AdminState>(
      listener: ((context, state) => {
        if(state is DeleteSuccess){
                      
        }
      }),
      builder: (_,AdminState state) {
        
        if (state is DeleteFailure){
          
        }

        return Scaffold(
        appBar: AppBar(title: const Text("List of Posts"),),
        body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: posts.length,
        itemBuilder: (context, index) => 
          Card(
            child: ListTile(
              onTap: () {
    
                },
              subtitle: Text(posts[index]['title']),
              trailing: GestureDetector(
                child: Icon(Icons.delete,),
                onTap: (){
                showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopup(context));
                },),
              title: Text("Post Name")),
          ),
            
             )
        
      
    
      );}
    );
    }
}