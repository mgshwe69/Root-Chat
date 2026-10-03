import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: Text('Settings', style: TextStyle(color: Colors.white))),
      body: ListView(
        children: [
          ListTile(leading: Icon(Icons.dark_mode, color: Colors.purple), title: Text('Dark Mode', style: TextStyle(color: Colors.white)), trailing: Switch(value: true, onChanged: (v) {}, activeColor: Colors.purple)),
          ListTile(leading: Icon(Icons.text_fields, color: Colors.purple), title: Text('Text Size', style: TextStyle(color: Colors.white)), trailing: Text('A A A', style: TextStyle(color: Colors.grey))),
          ListTile(leading: Icon(Icons.language, color: Colors.purple), title: Text('Language', style: TextStyle(color: Colors.white)), trailing: Text('English', style: TextStyle(color: Colors.grey))),
          ListTile(leading: Icon(Icons.notifications, color: Colors.purple), title: Text('Notifications', style: TextStyle(color: Colors.white))),
          ListTile(leading: Icon(Icons.lock, color: Colors.purple), title: Text('Privacy & Security', style: TextStyle(color: Colors.white))),
          ListTile(leading: Icon(Icons.help, color: Colors.purple), title: Text('Help & Support', style: TextStyle(color: Colors.white))),
          ListTile(leading: Icon(Icons.info, color: Colors.purple), title: Text('About', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
