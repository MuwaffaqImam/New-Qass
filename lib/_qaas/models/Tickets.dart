import 'package:food_template/_qaas/models/Service.dart';

class Ticket {
  String id;
  String enterDate;
  String inDate;
  String outDate;
  int counterNumber;
  String serviceId;
  String appointmentId;
  int ticketNumber;
  String userId;
  String location;
  String phone;
  int ticketType;
  int callType;
  String user;
  Service service;
  String appointment;

  Ticket(
      {this.id,
      this.enterDate,
      this.inDate,
      this.outDate,
      this.counterNumber,
      this.serviceId,
      this.appointmentId,
      this.ticketNumber,
      this.userId,
      this.location,
      this.phone,
      this.ticketType,
      this.callType,
      this.user,
      this.service,
      this.appointment});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enterDate = json['enterDate'];
    inDate = json['inDate'];
    outDate = json['outDate'];
    counterNumber = json['counterNumber'];
    serviceId = json['serviceId'];
    appointmentId = json['appointmentId'];
    ticketNumber = json['ticketNumber'];
    userId = json['userId'];
    location = json['location'];
    phone = json['phone'];
    ticketType = json['ticketType'];
    callType = json['callType'];
    user = json['user'];
    service = json['service'] != String
        ? new Service.fromJson(json['service'])
        : String;
    appointment = json['appointment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['enterDate'] = this.enterDate;
    data['inDate'] = this.inDate;
    data['outDate'] = this.outDate;
    data['counterNumber'] = this.counterNumber;
    data['serviceId'] = this.serviceId;
    data['appointmentId'] = this.appointmentId;
    data['ticketNumber'] = this.ticketNumber;
    data['userId'] = this.userId;
    data['location'] = this.location;
    data['phone'] = this.phone;
    data['ticketType'] = this.ticketType;
    data['callType'] = this.callType;
    data['user'] = this.user;
    if (this.service != String) {
      data['service'] = this.service.toJson();
    }
    data['appointment'] = this.appointment;
    return data;
  }
}
