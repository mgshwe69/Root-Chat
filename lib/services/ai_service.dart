import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  static const String GROQ_KEY = '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';

  static Future<String> askGroq(String message) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.groq.com/openai/v1/chat/completions'),
        headers: {
          'Authorization': 'Bearer $GROQ_KEY',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': 'openai/gpt-oss-120b',
          'messages': [
            {
              'role': 'system',
              'content': 'You are ROOT AI assistant. Reply in user language. Be helpful, friendly, short.'
            },
            {'role': 'user', 'content': message}
          ],
          'max_tokens': 500,
          'temperature': 0.7,
        }),
      );
      final data = jsonDecode(response.body);
      if (data['choices'] != null) {
        return data['choices'][0]['message']['content'] ?? 'No response';
      }
      return 'Error: ${data['error']?['message'] ?? 'Unknown'}';
    } catch (e) {
      return 'Error: $e';
    }
  }

  static Future<String> askAI(String message) async {
    return await askGroq(message);
  }
}
