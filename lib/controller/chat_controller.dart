import 'package:ai_chat_bot/config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import '../model/model.dart';

class ChatController extends GetxController {
  final _messages = <Message>[].obs;
  List<Message> get messages => _messages;
  final Gemini gemini = Gemini.instance;
  final geminiResponse = ''.obs;
  final isLoading = false.obs;

  final TextEditingController userChatController = TextEditingController();

  void addMessage(String senderName, String body) {
    final message = Message(
      senderName: senderName,
      body: body,
    );
    _messages.insert(0, message); // Add message to the beginning of the list
    update();
  }

  Future<void> sendMessageToGemini(
      String senderName, String messageText) async {
    try {
      isLoading.value = true;
      userChatController.clear();

      // Add the user's message
      addMessage(senderName, messageText);

      // Simulate sending the message to Gemini AI and receiving a response
      final responseText = await getGeminiResponse(messageText);

      // Add Gemini AI's response
      addMessage(Config.aiSender, responseText);
    } catch (e) {
      // Handle errors gracefully
      if (kDebugMode) {
        print('Error: $e');
      }
    } finally {
      isLoading.value = false;
      update();
    }
  }

  Future<String> getGeminiResponse(String messageText) async {
    try {
      final response = await gemini.text(messageText);
      return response?.output ?? "No response";
    } catch (e) {
      // Handle errors gracefully
      if (kDebugMode) {
        print('Error getting response from Gemini: $e');
      }
      return "Error";
    }
  }
}
