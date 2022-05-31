
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/Admin/bloc/bloc.dart';
import 'package:gada_ethiopia_mobile/lib.dart';
// import 'package:gada_ethiopia_mobile/lib.dart';


class ListPosts extends StatelessWidget {
 ListPosts({Key? key}) : super(key: key);
  

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
          final admin =  BlocProvider.of<AdminBloc>(context);
          admin.add(DeletePost(3));
                  
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
    var error = '';
    List posts = [{"title" : " thet" , "id" : 3},{"title" : " thet" , "id" : 3},{"title" : " thet" , "id" : 3}];
    return BlocProvider(create: (_) => AdminBloc(),
     child : BlocConsumer<AdminBloc , AdminState>(
      
      listener: ((_, state) => {
         
      }),
      builder: (_,AdminState state) {
       if(state is DeleteSuccess){
              // posts = datapro.getposs()
        }
        if (state is DeleteFailure){
          error = "delete unsuccessful";
        }

        return Scaffold(
        appBar: AppBar(title: const Text("List of Posts"),),
        body: SingleChildScrollView(

          child: Container(
            height: 500,
            child: 
                ListView.builder(
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
                        builder: (_) => _buildPopup(context));
                        },),
                      title: Text("Post Name")),
                  ),
               
            ),
          ),
        )
        
      
    
      );}
    )
    );
    }
}