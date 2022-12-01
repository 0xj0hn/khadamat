class Ticket {
  int id;
  int priority;
  String subject;
  String title;
  String description;
  int submitter;
  List<dynamic> answers;
  int status;
  Ticket(
    this.id,
    this.priority,
    this.subject,
    this.title,
    this.description,
    this.submitter,
    this.status,
    this.answers,
  );
  factory Ticket.fromJson(Map<String, dynamic> data) {
    return Ticket(
      data['id'],
      data['priority'],
      data['subject'],
      data['title'],
      data['description'],
      data['submitter'],
      data['status'],
      data['answers'],
    );
  }

  static List<Ticket> makeTicketsFromList(List<dynamic> data) {
    List<Ticket> tickets = [];
    for (var ticket in data) {
      Ticket tickett = Ticket.fromJson(ticket);
      tickets.add(tickett);
    }
    return tickets;
  }
}
