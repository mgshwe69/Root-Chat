import 'package:flutter/material.dart';

class AudioCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: Text('Audio Call', style: TextStyle(color: Colors.white))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 60, backgroundColor: Colors.purple, child: Icon(Icons.person, size: 60, color: Colors.white)),
            SizedBox(height: 20),
            Text('Dalli', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('00:24', style: TextStyle(color: Colors.grey, fontSize: 16)),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.mic_off, color: Colors.white, size: 30), onPressed: () {}),
                SizedBox(width: 30),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: Icon(Icons.call_end, color: Colors.white, size: 30),
                ),
                SizedBox(width: 30),
                IconButton(icon: Icon(Icons.speaker, color: Colors.white, size: 30), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
