import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    setState(() {
      _messages.insert(0, {'text': _messageController.text.trim(), 'sender': 'أنا'});
    });
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menbr Chat')),
      body: Column(children: [
        Expanded(
          child: _messages.isEmpty
           ? const Center(child: Text('ابدأ المحادثة 👇'))
            : ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ListTile(
                    title: Text(message['sender']!),
                    subtitle: Text(message['text']!),
                  );
                },
              ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(hintText: 'اكتب رسالتك...')
              )
            ),
            IconButton(icon: const Icon(Icons.send), onPressed: _sendMessage),
          ]),
        ),
      ]),
    );
  }
}
