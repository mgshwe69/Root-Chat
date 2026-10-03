import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: Text('Profile', style: TextStyle(color: Colors.white))),
      body: ListView(
        children: [
          SizedBox(height: 30),
          CircleAvatar(radius: 50, backgroundColor: Colors.purple, child: Icon(Icons.person, size: 50, color: Colors.white)),
          SizedBox(height: 20),
          Center(child: Text(user?.email ?? 'No email', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
          SizedBox(height: 5),
          Center(child: Text('Online', style: TextStyle(color: Colors.green, fontSize: 14))),
          SizedBox(height: 30),
          ListTile(leading: Icon(Icons.account_circle, color: Colors.purple), title: Text('Account', style: TextStyle(color: Colors.white)), trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15)),
          ListTile(leading: Icon(Icons.lock, color: Colors.purple), title: Text('Privacy', style: TextStyle(color: Colors.white)), trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15)),
          ListTile(leading: Icon(Icons.notifications, color: Colors.purple), title: Text('Notifications', style: TextStyle(color: Colors.white)), trailing: Switch(value: true, onChanged: (v) {}, activeColor: Colors.purple)),
          ListTile(leading: Icon(Icons.language, color: Colors.purple), title: Text('Language', style: TextStyle(color: Colors.white)), trailing: Text('English', style: TextStyle(color: Colors.grey))),
          ListTile(leading: Icon(Icons.help, color: Colors.purple), title: Text('Help & Support', style: TextStyle(color: Colors.white)), trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15)),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Log Out', style: TextStyle(color: Colors.red)),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
