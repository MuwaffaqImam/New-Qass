import 'dart:convert';

import 'package:food_template/_qaas/models/PrefrenceManager.dart';

class Api {
  static const String BASE_URL = "qaas-api.azurewebsites.net";
  static const String BASE_URL_LOGIN = "qaas-is.azurewebsites.net";
  static const String GET_TENANTS = '/Tenant';
  static const String GET_BRANCHES = '/Location/';
  static const String POST_LOGIN = 'connect/token';
  static const String POST_TICKETS = '/Ticket';
  static const String GET_SERVICES = '/services';
  static const String REGISTER = '/Accounts/register';

  static buildingBasicAuthorization() {
    String username = 'qaas.apix';
    String password = 'D04CDB91-F305-4997-9F35-BB257786DDAC';
    // String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    String basicAuth =
        'Basic cWFhcy5hcGk6RDA0Q0RCOTEtRjMwNS00OTk3LTlGMzUtQkIyNTc3ODZEREFD';
    print(basicAuth);
    return basicAuth;
  }

  static buildingBearerAuthorization() async{
    String username = 'qaas.apix';
    String password = 'D04CDB91-F305-4997-9F35-BB257786DDAC';
    // String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    String basicAuth = 'Bearer ${await PreferenceManager.getTokenAccess()}';
    print(basicAuth);
    return basicAuth;
  }
}
