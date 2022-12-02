import 'package:flutter/material.dart';

class Answer {
  int id;
  String detail;
  String createdAt;
  int ticketId;
  int submitter;
  Answer(this.id, this.detail, this.createdAt, this.ticketId, this.submitter);
  factory Answer.fromJson(Map<String, dynamic> data) {
    return Answer(
      data['id'],
      data['detail'],
      data['createdAt'],
      data['ticketId'],
      data['submitter'],
    );
  }
  static makeAnswersFromList(List<dynamic> list) {}
  //TODO: im here.
}
