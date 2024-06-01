import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import '../model/model.dart';

class ChatController extends GetxController {
  final _messages = <Message>[].obs;
  List<Message> get messages => _messages;
  final gemini = Gemini.instance;
  final geminiRsp = ''.obs;
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
    isLoading.value = true;
    // Add the user's message
    addMessage(senderName, messageText);

    // Simulate sending the message to Gemini AI and receiving a response
    final responseText = await getGeminiResponse(messageText);

    // Add Gemini AI's response
    addMessage('Gemini AI', responseText);
    isLoading.value = false;
    update();
  }

  Future<String> getGeminiResponse(String messageText) async {
    await gemini
        .text(messageText)
        .then((value) => geminiRsp.value = value!.output ?? "No responce")
        .catchError((e) => throw e);
    return geminiRsp.value;
  }
}
