import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gada_ethiopia_mobile/application/auth/bloc.dart';
import 'package:gada_ethiopia_mobile/application/auth/login/bloc.dart';
import 'package:gada_ethiopia_mobile/lib.dart';
import 'home.dart';

class Login extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
     width: double.infinity,
     decoration: BoxDecoration(
       gradient: LinearGradient(
         begin: Alignment.topLeft,
         end: Alignment.bottomRight,
         colors: [
           Colors.purple,
           Colors.blue,
         ],
       ),
     ),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       children: <Widget>[
         SizedBox(
           height: 70,
         ),
         Center(
           child: CircleAvatar(
             radius: 55,
             backgroundImage: AssetImage("assets/donate.jpg"),
           ),
         ),
         SizedBox(
           height: 15,
         ),
         Center(
           child: Text(
             "Login ",
             style: TextStyle(fontSize: 35, color: Colors.white),
           ),
         ),
         SizedBox(
           height: 35,
         ),
         Expanded(
           child: Container(
             width: double.infinity,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(30),
                   topRight: Radius.circular(30)),
               color: Colors.white,
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 SizedBox(
                   height: 70,
                 ),
                 Container(
                   width: 250,
                   child: Form(
                     key: formKey,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         TextFormField(
                           controller: usernameController,
                           decoration: InputDecoration(
                             errorStyle: TextStyle(color: Colors.red),
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20.0)),
                             labelStyle: TextStyle(
                                 fontSize: 20, color: Colors.purple),
                             enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.grey),
                             ),
                             errorBorder: OutlineInputBorder(
                               borderSide:
                                   BorderSide(color: Colors.redAccent),
                             ),
                             focusedErrorBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.red),
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.purple),
                             ),
                             floatingLabelBehavior:
                                 FloatingLabelBehavior.auto,
                             label: Text("Email"),
                             prefixIcon: Icon(Icons.person),
                           ),
                           validator: (username) {
                             if (username == null || username.isEmpty) {
                               return 'Username cannot be empty';
                             } else if (username.length > 20) {
                               return 'Username too long';
                             } else {
                               return null;
                             }
                           },
                         ),
                         SizedBox(
                           height: 30,
                         ),
                         Container(
                           height: 60,
                           child: TextFormField(
                                 controller: passwordController,
                                 obscureText: true,
                                    //  BlocProvider.of<PassBloc>(context)
                                    //      .isObscure,
                                 decoration: InputDecoration(
                                   errorStyle: TextStyle(color: Colors.red),
                                   border: OutlineInputBorder(
                                       borderRadius:
                                           BorderRadius.circular(10.0)),
                                   labelStyle: TextStyle(
                                       fontSize: 20, color: Colors.purple),
                                   enabledBorder: OutlineInputBorder(
                                     borderSide:
                                         BorderSide(color: Colors.grey),
                                   ),
                                   errorBorder: OutlineInputBorder(
                                     borderSide:
                                         BorderSide(color: Colors.redAccent),
                                   ),
                                   focusedErrorBorder: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.red),
                                   ),
                                   focusedBorder: OutlineInputBorder(
                                     borderSide:
                                         BorderSide(color: Colors.purple),
                                   ),
                                   floatingLabelBehavior:
                                       FloatingLabelBehavior.auto,
                                   label: Text("Password"),
                                   prefixIcon: Icon(Icons.lock_outline),
                                   
                                 ),
                                 validator: (value) {
                                   if (value == null || value.length < 8) {
                                     return 'minimum password length 8 ';
                                   } else {
                                     return null;
                                   }
                                 },
                               ),
                         )
                  
                       ],
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 25,
                 ),
                 Container(
                   child: Text(
                     "sign up ? ",
                     style: TextStyle(color: Colors.purple),
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 BlocConsumer<LoginBloc, LoginState>(
                   listenWhen: (_, current) {
                     return current is LoginSuccesful;
                   },
                   listener: (_, LoginState state) {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (_) => MyHomePage()),
                     );
                   },
                   builder: (_, LoginState state) {
                     Widget buttonChild = Text("Login");
                     if (state is Logingin) {
                       buttonChild = Text("Loging in ...");
                     } else if (state is LoginFailed) {
                       buttonChild = Text(
                         "Login Failed",
                         style: TextStyle(color: Colors.red),
                       );
                     }
                     return ElevatedButton(
                       onPressed: state is Logingin
                           ? null
                           : () {
                               final formstate =
                                   formKey.currentState!.validate();
                               if (!formstate) return;
                               final loginBloc =
                                   BlocProvider.of<LoginBloc>(context);
                               loginBloc.add(LoginEvent(
                                   usernameController.text,
                                   passwordController.text));
                             },
                       style: ElevatedButton.styleFrom(
                           primary: Colors.purple,
                           onPrimary: Colors.white,
                           fixedSize: Size(200, 20)),
                       child: buttonChild,
                     );
                   },
                 ),
               ],
             ),
           ),
         ),
       ],
     ),
      ),
    );
    
  }
}
