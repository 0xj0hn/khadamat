import 'package:TexBan/utils/api/user_provider.dart';
import 'package:TexBan/utils/models/ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketsDetailScreenStateModel extends GetxController {
  List<Ticket>? tickets = [];
  List<Widget> _widgetTickets = [];
  UserProvider userProvider = UserProvider();
  bool isTicketsLoading = false;
  List<Widget> get widgetTickets {
    return _widgetTickets;
  }

  fetchTickets() async {
    isTicketsLoading = true;
    tickets = await userProvider.ticketSection.fetchTickets();
    isTicketsLoading = false;
    update();
    if (tickets == null) return null;
    return tickets;
  }

  generateWidgetTickets(List<Widget> widgetTickets) {
    for (var widget in widgetTickets) {
      _widgetTickets.add(widget);
    }
    update();
    return _widgetTickets;
  }
}
