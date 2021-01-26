import 'package:flutter/material.dart';
import 'package:webviewDemo/Screens/Signup/components/body.dart';
import 'package:webviewDemo/Screens/Signup/signup_screen.dart';
import 'package:webviewDemo/Screens/app/news_screen.dart';
import 'package:webviewDemo/profile.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
  
  child: ListView(
    
    padding: EdgeInsets.zero,
    children: <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text('Wachiraporn & Suphattra '), 
        accountEmail: Text('Wachirporn.mara61@sskru.ac.th'),
        currentAccountPicture: CircleAvatar(
          child: FlutterLogo(
            size: 40.0,
          ),
          backgroundColor: Colors.white,
        ),
        ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('หน้าแรก'),
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => NewsPage()),
          );
         
        },
      ),
      ListTile(
        leading: Icon(Icons.account_box),
        title: Text('ข้อมูลส่วนตัว'),
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => MyProfile()),
          );
        },
      ),
       ListTile(
        leading: Icon(Icons.logout),
        title: Text('ออกจากระบบ'),
        onTap: () {
           Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => SignUpScreen()),
           );
        },
       ),
      ],
     ),
   );
  }
}