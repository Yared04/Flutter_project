
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/Admin/application/bloc.dart';


class ListUsers extends StatelessWidget {
 const ListUsers({Key? key}) : super(key: key);
  

  Widget _buildPopup(BuildContext context) {
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
          // final admin =  BlocProvider.of<AdminBloc>(context);
          // admin.add(DeleteUser(3));
                  
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
                builder: (_) => _buildPopup(context));
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
