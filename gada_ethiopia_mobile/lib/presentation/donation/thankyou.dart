import 'package:flutter/material.dart';

class Thankyou extends StatelessWidget{
  String name = "this donation";
  String num  = "100";
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
        drawer:Container(width: 200,color: Colors.blue,),
        body: ListView(
          children: [
            Column(
              // mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    image:DecorationImage(
                      image: AssetImage("assets/thankyou.png"),
                      fit: BoxFit.contain
                    )
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,0,8,20),
                  child: Text("You have successfully donated "+num+" birr to "+name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w400
                  ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    child: Text("Home"),
                    onPressed: (){},
                  ),
                )
              ]
            ),
          ],
        ),
      )
    );
  }

}