import 'package:TexBan/utils/models/ticket_model.dart';
import 'package:TexBan/widgets/appbar.dart';
import 'package:TexBan/widgets/custom_bubble.dart';
import 'package:TexBan/widgets/ticket_preview.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  Ticket ticket;
  TicketScreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(title: ticket.title),
      body: Stack(
        children: [
          ListView(
            reverse: true,
            children: [
              SizedBox(
                height: 50,
              ),
              CustomBubble(
                text: ticket.description,
                type: "sendBubble",
                time: DateTime.now().toIso8601String(),
              ),
            ],
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
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
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
