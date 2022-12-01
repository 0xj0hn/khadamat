import 'package:TexBan/utils/api/tickets_provider.dart';
import 'package:TexBan/widgets/appbar.dart';
import 'package:TexBan/widgets/ticket_preview.dart';
import 'package:flutter/material.dart';

class TicketsDetailScreen extends StatelessWidget {
  const TicketsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomedAppBar(title: "تیکت‌ها"),
      body: ListView.builder(
        itemBuilder: (_, index) => TicketPreview(
          title: index.toString(),
          issueTitle: index.toString(),
          description: index.toString(),
        ),
        itemCount: 4,
      ),
    );
  }
}
