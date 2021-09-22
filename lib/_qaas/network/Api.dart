import 'dart:convert';

class Api {
  static const String BASE_URL = "qaas-api.azurewebsites.net";
  static const String GET_TENANTS = '/Tenant';
  static const String GET_BRANCHES = '/Location/';
  ///Location/0b83b136-ca96-4fbc-b0bf-08d977038fd3/services?
  static const String GET_SERVICES = '/services';
  static const String REGISTER = '/Accounts/register';



 String buildingBasicAuthintication(){
   String username = 'qaas.apix';
   String password = 'D04CDB91-F305-4997-9F35-BB257786DDAC';
   String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
   print(basicAuth);
   return basicAuth;
 }










}
