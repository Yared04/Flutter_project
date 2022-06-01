import 'package:flutter/material.dart';

class MyContainer extends StatefulWidget {
  String pic;
  int goal;
  int raised;
  String title;
  String category;
  int donatorCount;
  String created;
  MyContainer(
      {required this.pic,
      required this.goal,
      required this.raised,
      required this.category,
      required this.created,
      required this.donatorCount,
      required this.title});
  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/'+super.widget.pic),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Text(
                  super.widget.title,
                  style: const TextStyle(color: Colors.black87, fontSize: 20 , fontWeight: FontWeight.bold),
                    ),
               
          SizedBox(
            width: double.maxFinite,
            height: 30,
            child: Stack(
              children: [
                const Positioned(top: 5, child: Icon(Icons.timelapse_rounded)),
                Positioned(
                  left: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Created ' + super.widget.created +' ago'),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text( super.widget.donatorCount.toString() + '+ person donated'),
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(
            width: double.maxFinite,
            height: 30,
            child: Stack(
              children: [
                
                Positioned(
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Goal: '+ super.widget.goal.toString() + ' birr',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Raised ' + super.widget.raised.toString()+ ' birr(' + ((super.widget.raised / super.widget.goal) * 100).floor().toString() + '%)',
                      style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
