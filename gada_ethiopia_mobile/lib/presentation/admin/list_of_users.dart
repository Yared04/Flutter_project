
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/admin/admin.dart';


class ListUsers extends StatelessWidget {
 const ListUsers({Key? key}) : super(key: key);
  

  Widget _buildPopup(BuildContext context, id) {
  return  AlertDialog(
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
          context.read<AdminBloc>().add(DeleteUser(id));

                  
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
        appBar: AppBar(title: const Text("List of Users")
        ),
        body: BlocBuilder<AdminBloc, AdminState>(
        builder:(_, state){
          if(state is UsersLoadFailure){
            return const Text("Failed.");
          }
          if(state is UsersLoaded){
            final users = state.users;
        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: users.length,
          itemBuilder: (context, index) => 
            Card(
              child: ListTile(
              onTap: () {
            
                },
              subtitle: Text("Goal: ${users[index].goal}"),
              trailing: GestureDetector(
                child: const Icon(Icons.delete,),
                onTap: (){
                showDialog(
                context: context,
                builder: (_) => _buildPopup(context, users[index].id));
                },),
              title: Text(users[index].title)),
          ),
             
          );
          }
          return const CircularProgressIndicator();
        }
        
    )
    
  );
}
      
}
