import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/application/admin/admin.dart';

import 'package:gada_ethiopia_mobile/application/post/campaign_state.dart';
import 'package:go_router/go_router.dart';


class ListPosts extends StatelessWidget {
  const ListPosts({Key? key}) : super(key: key);
  
  Widget _buildPopup(BuildContext context, id) {
    return AlertDialog(
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
            try {
              context.read<AdminBloc>().add(DeletePost(id));
            } catch (e) {
              print(e);
            }
            // context.pushNamed('listOfPosts');
          },
          child: const Text('Yes'),
        ),
        TextButton(
            onPressed: () {
              context.pushNamed('listOfPosts');
              // Navigator.of(context).pop();
            },
            child: const Text("No"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

        final post = BlocProvider.of<AdminBloc>(context);
      post.add(LoadPost());
    return Scaffold(
        appBar: AppBar(title: const Text("List of Posts")),
        body: BlocConsumer<AdminBloc, AdminState>(
            listener: (_, state) => {
                  if (state is DeleteSuccess) { 
                    context.pushNamed("home")}
                },
            builder: (_, state) {
              if (state is Loading) {
                var post = BlocProvider.of<AdminBloc>(context);
                post.add(LoadPost());
                
              }

              if (state is PostLoaded) {
                final posts = state.posts;
                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: posts.length > 0 ? posts.length : 1,
                  itemBuilder: (_, index) => posts.length > 0 ? Card(
                    child: ListTile(
                        onTap: () {
                          context.pushNamed('edit-post', params: {'id':posts[index].id.toString()});
                        },
                        subtitle: Text("Goal: ${posts[index].goal}"),
                        trailing: GestureDetector(
                          child: const Icon(
                            Icons.delete,
                          ),
                          onTap: () {
                            showDialog(
                                context: _,
                                builder: (_) =>
                                    _buildPopup(context, posts[index].id));
                          },
                        ),
                        title: Text(posts[index].title)),
                  ) : Center(child: Image(image: AssetImage('assets/creative2.png'))) ,
                );
              } else if (state is LoadFailed) {
                return Center(child:Text("Failed."));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
