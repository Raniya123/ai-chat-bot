import 'package:ai_chat_bot/controller/chat_controller.dart';
import 'package:ai_chat_bot/theme/assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ai_chat_bot/theme/theme.dart';
import 'package:get/get.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final _chat = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppThemes.mainAppBar("AI - CHATBOT"),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          verticalDirection: VerticalDirection.up,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: TextField(
                        controller: _chat.userChatController,
                        onChanged: (value) {
                          if (kDebugMode) {
                            print(value);
                          }
                        },
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          labelText: 'Enter text',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      _chat.sendMessageToGemini(
                          "me", _chat.userChatController.text);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppThemes.greenColor.withOpacity(0.6),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Text(
                        "ADD",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Obx(
              () => _chat.isLoading.value
                  ? Lottie.asset(
                      fit: BoxFit.fitHeight,
                      Assets.loading,
                      height: 60,
                    )
                  : const SizedBox(
                      height: 20,
                    ),
            ),
            Expanded(
                child: Obx(() => ListView.builder(
                    padding: const EdgeInsets.all(0),
                    reverse: true, // to add new items from bottom to top
                    itemCount: _chat.messages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? AppThemes.orgColor
                              : AppThemes.greenColor,
                          border: Border.all(width: 0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _chat.messages[index].senderName,
                              maxLines: 10,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w900),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: MarkdownBody(
                                data: _chat.messages[index].body,
                              ),
                            )
                          ],
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
