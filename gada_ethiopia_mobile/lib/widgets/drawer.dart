import 'package:gada_ethiopia_mobile/lib.dart';
import 'package:flutter/material.dart';
import 'home.dart';

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
          const NavItem(title: "List Of Users", icon: Icons.roofing_rounded, widget: 'ListOfUsers' ),
          const NavItem(
              title: "List Of Posts", icon: Icons.account_balance_sharp, widget: 'ListOfPosts'),
          // const NavItem(title: "Profile", icon: Icons.person, widget: 'profile'),
          const NavItem(title: "Log Out", icon: Icons.logout, widget: 'login')
        ],
      ),
    );
  }
}
