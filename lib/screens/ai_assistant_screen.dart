import 'package:flutter/material.dart';
import '../services/ai_service.dart';

class AIAssistantScreen extends StatefulWidget {
  @override
  _AIAssistantScreenState createState() => _AIAssistantScreenState();
}

class _AIAssistantScreenState extends State<AIAssistantScreen> {
  final _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _loading = false;

  Future<void> _send() async {
    if (_controller.text.trim().isEmpty) return;
    final userMsg = _controller.text;
    setState(() {
      _messages.add({'role': 'user', 'text': userMsg});
      _loading = true;
    });
    _controller.clear();

    try {
      final reply = await AIService.askAI(userMsg);
      setState(() => _messages.add({'role': 'ai', 'text': reply}));
    } catch (e) {
      setState(() => _messages.add({'role': 'ai', 'text': 'Error: $e'}));
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('AI Assistant', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, i) {
                final msg = _messages[i];
                final isUser = msg['role'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.purple : Color(0xFF2A2A3B),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(msg['text'] ?? '', style: TextStyle(color: Colors.white)),
                  ),
                );
              },
            ),
          ),
          if (_loading) LinearProgressIndicator(color: Colors.purple),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Ask me anything...',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Color(0xFF2A2A3B),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.send, color: Colors.purple), onPressed: _send),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
