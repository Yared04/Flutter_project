
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/application/admin/admin.dart';


class ListDonations extends StatelessWidget {
  
 const ListDonations({Key? key}) : super(key: key);

  Widget _buildPopup(BuildContext context, id) {
  return  AlertDialog(
    title: const Text('Delete Post'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
         Text("Are you sure you want to delete this post?"),
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
        appBar: AppBar(title: const Text("My Donations")
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
              subtitle: Text("Goal: ${posts[index].goal}"),
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
