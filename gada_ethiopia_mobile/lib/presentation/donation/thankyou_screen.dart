import 'package:flutter/material.dart';
import 'package:gada_ethiopia_mobile/lib.dart';
import 'package:go_router/go_router.dart';

class Thankyou_Screen extends StatelessWidget {
  String name = "this donation";
  String num = "100";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          
          appBar: AppBar(
            backgroundColor: Colors.grey[50],
            foregroundColor: Colors.green,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          drawer: MyDrawer(),
          body: ListView(
            children: [
              Column(
                  // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/thankyou.png"),
                              fit: BoxFit.contain)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 20),
                      child: Text(
                        "You have successfully donated thank you"
                         ,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(50),
                              primary: Colors.green),
                          child: Text("Return Home"),
                          onPressed: () {
                            context.go('/posts');
                          },
                        ),
                      ),
                    )
                  ]),
            ],
          ),
        ));
  }
}
