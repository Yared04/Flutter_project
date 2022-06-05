import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/application/admin/admin.dart';

import 'package:gada_ethiopia_mobile/application/post/campaign_state.dart';
import 'package:go_router/go_router.dart';


class ListUsers extends StatelessWidget {
  const ListUsers ({Key? key}) : super(key: key);
  
  Widget _buildPopup(BuildContext context, id) {
    return AlertDialog(
      title: const Text('Delete User'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Are you sure you want to delete this user?"),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            try {
              context.read<AdminBloc>().add(DeleteUser(id));
            } catch (e) {
              }
            context.pushNamed('home');
          },
          child: const Text('Yes'),
        ),
        TextButton(
            onPressed: () {
              context.pushNamed('listOfUsers');
              // Navigator.of(context).pop();
            },
            child: const Text("No"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

        final user = BlocProvider.of<AdminBloc>(context);
      user.add(LoadUsers());
    return Scaffold(
        appBar: AppBar(title: const Text("List of users")),
        body: BlocConsumer<AdminBloc, AdminState>(
            listener: (_, state) => {
                  if (state is DeleteSuccess) { 
                    context.pushNamed("home")}
                },
            builder: (_, state) {
              if (state is Loading) {
                var user = BlocProvider.of<AdminBloc>(context);
                user.add(LoadUsers());
                
              }

              if (state is UsersLoaded) {
                final users = state.users;
                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: users.length > 0 ? users.length : 1,
                  itemBuilder: (_, index) => users.length > 0 ? Card(
                    child: ListTile(
                        // onTap: () {
                        //   // context.pushNamed('edit-user', params: {'id':users[index].id.toString()});
                        // },
                        subtitle: Text("Email: ${users[index].email}"),
                        trailing: GestureDetector(
                          child: const Icon(
                            Icons.delete,
                          ),
                          onTap: () {
                            showDialog(
                                context: _,
                                builder: (_) =>
                                    _buildPopup(context, users[index].id));
                          },
                        ),
                        title: Text(users[index].first_name)),
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
