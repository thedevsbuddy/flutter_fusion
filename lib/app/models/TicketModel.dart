// To parse this JSON data, do
//
//     final ticketModel = ticketModelFromJson(jsonString);

import 'dart:convert';

TicketModel ticketModelFromJson(String str) => TicketModel.fromJson(json.decode(str));

String ticketModelToJson(TicketModel data) => json.encode(data.toJson());

class TicketModel {
  TicketModel({
    required this.id,
    this.ticketNumber,
    this.priority,
    this.status,
    this.subject,
    this.user,
    this.problem,
    this.createdDate,
    this.lastUpdated,
  });

  String id;
  String? ticketNumber;
  String? priority;
  String? status;
  String? subject;
  String? user;
  String? problem;
  String? createdDate;
  dynamic lastUpdated;

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        id: json["id"],
        ticketNumber: json["ticketNumber"] ?? null,
        priority: json["priority"] ?? null,
        status: json["status"] ?? null,
        subject: json["subject"] ?? null,
        user: json["user"] ?? null,
        problem: json["problem"] ?? null,
        createdDate: json["createdDate"] ?? null,
        lastUpdated: json["lastUpdated"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ticketNumber": ticketNumber,
        "priority": priority,
        "status": status,
        "subject": subject,
        "user": user,
        "problem": problem,
        "createdDate": createdDate,
        "lastUpdated": lastUpdated,
      };
}
