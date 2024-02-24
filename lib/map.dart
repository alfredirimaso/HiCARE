import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PregnantMothersChatbotApp extends StatelessWidget {
  const PregnantMothersChatbotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pregnant Mothers Chatbot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChatbotPage(),
    );
  }
}

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({
    required this.text,
    required this.isUser,
  });
}

class _ChatbotPageState extends State<ChatbotPage> {
  String apiKey =
      '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'; // Initialize with your GPT-3 API key
  final TextEditingController textEditingController = TextEditingController();
  List<ChatMessage> messages = [];

  void _handleUserMessage(String text) async {
    // Make a request to the GPT-3 API using your API key.
    final response = await callGpt3Api(text, apiKey);

    setState(() {
      messages.add(ChatMessage(
        text: text,
        isUser: true,
      ));

      messages.add(ChatMessage(
        text: response,
        isUser: false,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pregnant Mothers Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Text(
                    message.text,
                    textAlign:
                        message.isUser ? TextAlign.right : TextAlign.left,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textEditingController,
              onSubmitted: (text) {
                _handleUserMessage(text);
              },
              decoration: InputDecoration(
                hintText: 'Type your message...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _handleUserMessage(textEditingController.text);
                    textEditingController.clear();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<String> callGpt3Api(String userMessage, String apiKey) async {
  const url = 'https://api.openai.com/v1/engines/davinci/completions';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };
  final data = {
    'prompt': userMessage,
    'max_tokens': 50, // Adjust based on your needs
  };

  try {
    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(data));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['choices'][0]['text'];
    } else {
      throw Exception('Failed to call GPT-3 API - ${response.statusCode}');
    }
  } catch (e) {
    // Handle any exceptions that occur during the API call.
    throw Exception('Error calling GPT-3 API: $e');
  }
}
