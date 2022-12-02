import 'dart:isolate';

import 'package:TexBan/utils/api/user_provider.dart';
import 'package:TexBan/utils/models/answer_model.dart';
import 'package:TexBan/widgets/custom_bubble.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TicketScreenModel extends GetxController {
  bool isChatsLoading = false;
  UserProvider userProvider = UserProvider();
  List<Widget> chatBubbles = [];
  List<Answer?> answers = [];

  getAnswersAndUpdateChatBubbles(List<dynamic> answerIds) async {
    answers = [];
    toggleLoading();
    for (int answerId in answerIds) {
      Answer? answer = await userProvider.ticketSection.getAnswer(answerId);
      if (answer == null) return;
      answers.add(answer);
    }
    updateChatBubbles(answers);
    toggleLoading();
  }

  toggleLoading() {
    isChatsLoading = !isChatsLoading;
    update();
  }

  updateChatBubbles(List<Answer?> answers) {
    chatBubbles = [];
    var box = Hive.box("auth");
    toggleLoading();
    for (Answer? answer in answers) {
      generateChatBubble(
        answer!.detail,
        answer.createdAt,
        answer.submitter == box.get("user_id"),
      );
    }
    toggleLoading();
  }

  generateChatBubble(String text, String time, bool isMessageForMe) {
    chatBubbles.add(
      CustomBubble(
        text: text,
        time: time,
        type: isMessageForMe ? "sendBubble" : "receiveBubble",
      ),
    );
    update();
  }
}
