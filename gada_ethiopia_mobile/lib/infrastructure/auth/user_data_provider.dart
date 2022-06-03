import 'dart:convert';
// ;
// import 'dart:io';
import 'package:http/http.dart' as http;
// import 'package:gada_ethiopia_mobile/lib.dart';
import '../../domain/auth/user_model.dart';

class UserDataProvider{
  final _baseUri = 'http://10.5.232.114:3000/';
  final http.Client client;
 

  UserDataProvider({required this.client});
   Future<User> createUser(User user) async {
     final response = await client.post(
       Uri.http(_baseUri, 'create-user'),
       headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
       },
       body: jsonEncode(<String, dynamic>{
         'first_name': user.first_name,
         'last_name' : user.last_name,
         'email' : user.email,
         'password' : user.password,
       })
     );

     if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user.');
    }
  }

  Future<List<User>> getUsers() async{
    final response = await client.get(Uri.http(_baseUri, '/users'));

    if( response.statusCode == 200){
      final users = jsonDecode(response.body) as List;
      List<User> ret = [];

      for (var user in users) {
        try {
          ret.add(User.fromJson(user));
        } catch (e) {
          throw Exception('Failed to load courses');
        }
      }
      return ret;}
    else{
      throw("Failed to load users.");
    }
  }

  Future<void> deleteUser(int id) async{
      final http.Response response = await client.delete(
      Uri.parse('$_baseUri/user-detail/$id'),
      headers: <String, String>{
        'Type': 'application/json; charset = UTF-8',
      },
    );
    if (response.statusCode != 204) {
      throw Exception('Failed to delete user');
    }

  }

  Future<void> updateUser(User user) async {
    final http.Response response = await client.put(
      Uri.http(_baseUri, 'users/${user.id}'),

      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'first_name': user.first_name,
         'last_name' : user.last_name,
         'email' : user.email,
         'password' : user.password,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Operation Failed.');
    }
  }



  
 
}