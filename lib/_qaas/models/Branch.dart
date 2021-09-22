class Branch {

  String id;
  String name;
  String address;
  String addressCountry;
  String phone;
  String email;
  String timeZone;
  int countersNumber;
  String tenantId;
  String tenant;
  String signalRToken;

  Branch({this.id,
    this.name,
    this.address,
    this.addressCountry,
    this.phone,
    this.email,
    this.timeZone,
    this.countersNumber,
    this.tenantId,
    this.tenant,
    this.signalRToken});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'] ;
    name = json['name'] ;
    address = json['address'] ;
    addressCountry = json['addressCountry'] ;
    phone = json['phone'] ;
    email = json['email'] ;
    timeZone = json['timeZone'] ;
    countersNumber = json['countersNumber'] ;
    tenantId = json['tenantId'] ;
    tenant = json['tenant'] ;
    signalRToken = json['signalRToken'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['addressCountry'] = this.addressCountry;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['timeZone'] = this.timeZone;
    data['countersNumber'] = this.countersNumber;
    data['tenantId'] = this.tenantId;
    data['tenant'] = this.tenant;
    data['signalRToken'] = this.signalRToken;
    return data;
  }


}