import 'dart:convert';

class Api {
  static const String BASE_URL = "https://qaas-api.azurewebsites.net";
  static const String BASE_URL_LOGIN = "https://qaas-is.azurewebsites.net";

  static const String GET_TENANTS = '/Tenant';
  static const String GET_BRANCHES = '/Location/';
  static const String REGISTER = '/Accounts/register';
  static const String LOGIN = '/connect/token';

  // username : qaas.api
  // D04CDB91-F305-4997-9F35-BB257786DDAC


  static String buildingBasicAuthintication(){
    String username = 'qaas.apix';
    String password = 'D04CDB91-F305-4997-9F35-BB257786DDAC';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);
    return basicAuth;
  }


}
