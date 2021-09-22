import 'Tenants.dart';
import 'User.dart';

class ServiceProvided {
  String id;
  String parentService;
  int priority;
  int duration;
  String created;
  String startTime;
  String endTime;
  String locationId;
  String serviceId;
  String location;
  Service service;
  User users;
  String chr;

  ServiceProvided(
      {this.id,
        this.parentService,
        this.priority,
        this.duration,
        this.created,
        this.startTime,
        this.endTime,
        this.locationId,
        this.serviceId,
        this.location,
        this.service,
        this.users,
        this.chr});

  ServiceProvided.fromJson(Map<String, dynamic> json) {
    id = json['id']?? "";
    parentService = json['parentService'];
    priority = json['priority']?? "priority";
    duration = json['duration']?? "duration";
    created = json['created']?? "created";
    startTime = json['startTime']?? "startTime";
    endTime = json['endTime']?? "endTime";
    locationId = json['locationId'];
    serviceId = json['serviceId'];
    location = json['location']?? "عمار الأردن";
    service =  new Service.fromJson(json['service']);
    users = json['users'];
    chr = json['chr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parentService'] = this.parentService;
    data['priority'] = this.priority;
    data['duration'] = this.duration;
    data['created'] = this.created;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['locationId'] = this.locationId;
    data['serviceId'] = this.serviceId;
    data['location'] = this.location;
    if (this.service != null) {
      data['service'] = this.service.toJson();
    }
    data['users'] = this.users;
    data['chr'] = this.chr;
    return data;
  }
}

class Service {
  String id;
  String name;
  String description;
  bool publicEnabled;
  String tenantId;
  Tenant tenant;

  Service(
      {this.id,
        this.name,
        this.description,
        this.publicEnabled,
        this.tenantId,
        this.tenant});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? "name";
    description = json['discription'] ?? "descri ption";
    publicEnabled = json['publicEnabled'];
    tenantId = json['tenantId'];
    tenant = json['tenant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['discription'] = this.description;
    data['publicEnabled'] = this.publicEnabled;
    data['tenantId'] = this.tenantId;
    data['tenant'] = this.tenant;
    return data;
  }
}
