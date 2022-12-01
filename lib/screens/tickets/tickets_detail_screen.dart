import 'package:TexBan/utils/api/fake_data.dart';
import 'package:TexBan/utils/api/tickets_provider.dart';
import 'package:TexBan/utils/models/ticket_model.dart';
import 'package:TexBan/utils/models/tickets_detail_screen_state_model.dart';
import 'package:TexBan/widgets/appbar.dart';
import 'package:TexBan/widgets/ticket_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class TicketsDetailScreen extends StatelessWidget {
  const TicketsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Ticket> tickets = [];
    return Scaffold(
      appBar: CustomedAppBar(title: "تیکت‌ها"),
      body: GetBuilder<TicketsDetailScreenStateModel>(
        init: TicketsDetailScreenStateModel(),
        didChangeDependencies: (model) async {
          await model.controller?.fetchTickets();
        },
        builder: (model) {
          if (model.tickets!.isEmpty && !model.isTicketsLoading) {
            return Center(child: Text("محتوایی نیست!"));
          } else if (model.isTicketsLoading) {
            return Center(
              child: Container(
                height: 30,
                width: 30,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballBeat,
                ),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => model.fetchTickets(),
            child: ListView.builder(
              itemBuilder: (_, index) => TicketPreview(
                ticket: model.tickets![index],
              ),
              itemCount: model.tickets!.length,
            ),
          );
        },
      ),
    );
  }
}
