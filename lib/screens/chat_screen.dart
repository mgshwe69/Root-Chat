import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'audio_call_screen.dart';
import 'video_call_screen.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  ChatScreen({required this.name});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();

  Future<void> _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;
    await FirebaseFirestore.instance.collection('messages').add({
      'text': _messageController.text,
      'senderId': FirebaseAuth.instance.currentUser!.uid,
      'senderEmail': FirebaseAuth.instance.currentUser!.email,
      'timestamp': FieldValue.serverTimestamp(),
    });
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 16)),
            Text('online', style: TextStyle(color: Colors.green, fontSize: 12)),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.call, color: Colors.purple), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AudioCallScreen()))),
          IconButton(icon: Icon(Icons.videocam, color: Colors.purple), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => VideoCallScreen()))),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('messages').orderBy('timestamp').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Center(child: CircularProgressIndicator(color: Colors.purple));
                final messages = snapshot.data!.docs;
                return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: messages.length,
                  itemBuilder: (context, i) {
                    final msg = messages[i].data() as Map<String, dynamic>;
                    final isMe = msg['senderId'] == FirebaseAuth.instance.currentUser!.uid;
                    return Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.purple : Color(0xFF2A2A3B),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(msg['text'] ?? '', style: TextStyle(color: Colors.white)),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.image, color: Colors.purple), onPressed: () {}),
                IconButton(icon: Icon(Icons.mic, color: Colors.purple), onPressed: () {}),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Color(0xFF2A2A3B),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.send, color: Colors.purple), onPressed: _sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
