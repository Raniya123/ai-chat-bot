import 'package:ai_chat_bot/config.dart';
import 'package:ai_chat_bot/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ai_chat_bot/model/model.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: message.senderName == Config.aiSender
            ? AppThemes.orgColor
            : AppThemes.greenColor,
        border: Border.all(width: 0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.senderName,
            maxLines: 10,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: MarkdownBody(
              selectable: true,
              data: message.body,
            ),
          ),
        ],
      ),
    );
  }
}
