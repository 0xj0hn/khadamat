import 'package:TexBan/screens/tickets/ticket_screen.dart';
import 'package:TexBan/utils/app_service/app_service.dart';
import 'package:TexBan/utils/models/ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';

class TicketPreview extends StatelessWidget {
  Ticket ticket;
  TicketPreview({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.of(context).push(
              GetPageRoute(
                page: () => TicketScreen(
                  ticket: ticket,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 30,
              bottom: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(ticket.subject),
                      Text(ticket.description),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Chip(
                        label: Text(
                          AppService.convertStatusToPersion(ticket.status),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                AppService.convertStatusToColor(ticket.status),
                          ),
                        ),
                        backgroundColor: AppService.convertStatusToColor(
                          ticket.status,
                        ).withOpacity(0.2),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Chip(
                        label: Text(
                          AppService.convertPriorityToPersian(ticket.priority),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(0.2),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.messenger),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
