import 'dart:convert';
// import 'dart:io';
import 'package:http/http.dart' as http;
// import 'package:gada_ethiopia_mobile/lib.dart';
import '../../domain/auth/user_model.dart';


class UserDataProvider{
  // final _baseUri = 'http://10.5.224.216:3000/';
// class UserDataProvider {
  final _baseUri = 'http://10.5.224.216:3000/';
  final http.Client client;

  UserDataProvider({required this.client});

  Future<User?> createUser(User user) async {
    var response = await client.post(Uri.parse("${_baseUri}users"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'first_name': user.first_name,
          'last_name': user.last_name,
          'email': user.email,
          'password': user.password,
        }));
    // ))

    if (response.statusCode == 201) {
      return user;

    } else {
      return null;
    }

    // try {
    //   final response = await client
    //       .post(Uri.parse("${_baseUri}users"), headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   }, body: {
    //     'first_name': user.first_name,
    //     'last_name': user.last_name,
    //     'email': user.email,
    //     'password': user.password,
    //   });
    // } catch (e) {
    //   return null;

    // }
    // var response;
    // print(response);
  }

  Future<List<User>> getUsers() async {
    final response = await client.get(Uri.parse('${_baseUri}users'));

    if (response.statusCode == 200) {
      final users = jsonDecode(response.body) as List;
      List<User> ret = [];

      for (var user in users) {
        try {
          ret.add(User.fromJson(user));
        } catch (e) {
          throw Exception('Failed to load courses');
        }
      }
      return ret;
    } else {
      throw ("Failed to load users.");
    }
  }

  Future<void> deleteUser(int id) async {
    final http.Response response = await client.delete(
      Uri.parse('{$_baseUri}users/$id'),
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
      Uri.parse('${_baseUri}users/${user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'first_name': user.first_name,
        'last_name': user.last_name,
        'email': user.email,
        'password': user.password,
      }),
    );

    if (response.statusCode != 204) {
      throw Exception('Operation Failed.');
    }
  }
  
  Future<User?> searchUser(User user) async {
    print("search usr");
    var response = await client.post(Uri.parse("${_baseUri}email-password"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': user.email,
          'password': user.password,
        }));
    // ))
    print(response.statusCode);

    if (response.statusCode == 200) {
      print("finally");
      return user;
    } else {
      return null;
    }
  }
}
