import 'package:ai_chat_bot/config.dart';
import 'package:ai_chat_bot/view/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/chat_controller.dart';
import '../../theme/assets.dart';
import '../../theme/theme.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final _chat = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: AppThemes.mainAppBar(Config.appName),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              ChatInput(
                chatController: _chat,
              ),
              Obx(
                () => _chat.isLoading.value
                    ? Lottie.asset(
                        Assets.loading,
                        height: 60,
                      )
                    : const SizedBox(
                        height: 10,
                      ),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    padding: const EdgeInsets.all(0),
                    reverse: true,
                    itemCount: _chat.messages.length,
                    itemBuilder: (context, index) {
                      return MessageCard(message: _chat.messages[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
