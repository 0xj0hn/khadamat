import 'package:TexBan/utils/models/ticket_model.dart';
import 'package:TexBan/utils/models/ticket_screen_model.dart';
import 'package:TexBan/utils/models/tickets_detail_screen_state_model.dart';
import 'package:TexBan/widgets/appbar.dart';
import 'package:TexBan/widgets/custom_bubble.dart';
import 'package:TexBan/widgets/ticket_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class TicketScreen extends StatelessWidget {
  Ticket ticket;
  TicketScreen({super.key, required this.ticket});
  TextEditingController textController = TextEditingController();
  TicketScreenModel ticketScreenModel = Get.find();
  TicketsDetailScreenStateModel ticketsDetailModel = Get.find();
  updateChatsAndTickets() async {
    await ticketsDetailModel.fetchTickets();
    List<dynamic> answers =
        await ticketsDetailModel.updateAndChangeSpecificTicket(ticket.id);
    ticketScreenModel.getAnswersAndUpdateChatBubbles(answers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(title: ticket.title),
      body: Stack(
        children: [
          GetBuilder<TicketScreenModel>(
            init: TicketScreenModel(),
            didChangeDependencies: (state) async {
              List answers = ticket.answers;
              await state.controller!.getAnswersAndUpdateChatBubbles(answers);
            },
            builder: (model) {
              return RefreshIndicator(
                onRefresh: () async {
                  updateChatsAndTickets();
                },
                child: ListView(
                  reverse: true,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    if (model.isChatsLoading)
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 20,
                        width: 20,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballBeat,
                        ),
                      ),
                    ...model.chatBubbles.reversed,
                    CustomBubble(
                      text: ticket.description,
                      type: "sendBubble",
                      time: DateTime.now().toIso8601String(),
                    ),
                  ],
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 200,
              child: Container(
                color: Theme.of(context).canvasColor,
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: TextField(
                        controller: textController,
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "پیامی وارد کنید...",
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () async {
                          if (textController.text.isEmpty) return;

                          ticketScreenModel.userProvider.ticketSection
                              .sendAnswer(
                            ticket.id,
                            textController.text,
                          );
                          updateChatsAndTickets();
                          textController.text = "";
                        },
                        icon: Icon(
                          Icons.send,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
