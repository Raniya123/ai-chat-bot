import 'package:ai_chat_bot/controller/chat_controller.dart';
import 'package:ai_chat_bot/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final ChatController chatController;
  const ChatInput({super.key, required this.chatController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppThemes.margin),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: TextField(
              scrollPadding: const EdgeInsets.all(0),
              maxLines: 2,
              controller: chatController.userChatController,
              onChanged: (value) {
                if (kDebugMode) {
                  print(value);
                }
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: InputBorder.none,
                labelText: 'Enter text',
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                chatController.sendMessageToGemini(
                    "me", chatController.userChatController.text);
              },
              child: Container(
                padding: EdgeInsets.all(AppThemes.margin),
                decoration: BoxDecoration(
                  color: AppThemes.greenColor.withOpacity(0.6),
                  border: Border.all(color: Colors.black),
                ),
                child: const Text(
                  "ADD",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
