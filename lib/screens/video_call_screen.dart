import 'package:flutter/material.dart';

class VideoCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Color(0xFF2A2A3B),
              child: Center(child: Icon(Icons.person, size: 150, color: Colors.grey)),
            ),
          ),
          Positioned(
            top: 40, right: 20,
            child: Container(
              width: 100, height: 150,
              decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(15)),
              child: Icon(Icons.person, color: Colors.white, size: 50),
            ),
          ),
          Positioned(
            top: 50, left: 20,
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
                Text('Dalli', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Positioned(
            bottom: 40, left: 0, right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.mic_off, color: Colors.white, size: 30), onPressed: () {}),
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: Icon(Icons.call_end, color: Colors.white, size: 30),
                ),
                SizedBox(width: 20),
                IconButton(icon: Icon(Icons.videocam_off, color: Colors.white, size: 30), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
