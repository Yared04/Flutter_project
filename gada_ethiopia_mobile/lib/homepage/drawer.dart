import 'package:gada_ethiopia_mobile/lib.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
 const MyDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
           Container(
            // width: 17,
            height: 250,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
                   image: DecorationImage(
                    image: AssetImage("assets/gada_logo.jpg"), fit: BoxFit.fitWidth)),
          ),
          const Divider(),
          const NavItem(title: "one", icon: Icons.roofing_rounded, widget: MyHomePage()),
          const NavItem(
              title: "two", icon: Icons.account_balance_sharp, widget: MyHomePage()),
          const NavItem(title: "Profile", icon: Icons.person, widget: MyHomePage()),
          const NavItem(title: "Log Out", icon: Icons.logout, widget: MyHomePage())
        ],
      ),
    );
  }
}
