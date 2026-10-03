import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'ai_assistant_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'audio_call_screen.dart';
import 'video_call_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ChatListTab(),
    AudioCallScreen(),
    VideoCallScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        backgroundColor: Colors.black,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
          BottomNavigationBarItem(icon: Icon(Icons.videocam), label: 'Video'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class ChatListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Icon(Icons.home, color: Colors.purple),
            SizedBox(width: 10),
            Text('ROOT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SettingsScreen())),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.purple, child: Icon(Icons.smart_toy, color: Colors.white)),
            title: Text('AI Assistant', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: Text('Ask me anything', style: TextStyle(color: Colors.grey)),
            trailing: Text('9:41 PM', style: TextStyle(color: Colors.grey, fontSize: 12)),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AIAssistantScreen())),
          ),
          Divider(color: Colors.grey[800]),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.blue, child: Text('D', style: TextStyle(color: Colors.white))),
            title: Text('Dalli', style: TextStyle(color: Colors.white)),
            subtitle: Text('Miss you', style: TextStyle(color: Colors.grey)),
            trailing: Text('9:32 PM', style: TextStyle(color: Colors.grey, fontSize: 12)),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(name: 'Dalli'))),
          ),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.green, child: Text('F', style: TextStyle(color: Colors.white))),
            title: Text('Friends Group', style: TextStyle(color: Colors.white)),
            subtitle: Text('Be safe', style: TextStyle(color: Colors.grey)),
            trailing: Text('7:29 PM', style: TextStyle(color: Colors.grey, fontSize: 12)),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(name: 'Friends Group'))),
          ),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.orange, child: Text('G', style: TextStyle(color: Colors.white))),
            title: Text('Gaming Squad', style: TextStyle(color: Colors.white)),
            subtitle: Text('Play PUBG tonight!', style: TextStyle(color: Colors.grey)),
            trailing: Text('6:13 PM', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.red, child: Text('M', style: TextStyle(color: Colors.white))),
            title: Text('Mom', style: TextStyle(color: Colors.white)),
            subtitle: Text('Take care', style: TextStyle(color: Colors.grey)),
            trailing: Text('5:30 PM', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.edit, color: Colors.white),
        onPressed: () {},
      ),
    );
  }
}
