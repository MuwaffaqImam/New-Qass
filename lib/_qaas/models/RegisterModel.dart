import 'common/ps_object.dart';

class RegisterResponseModel extends PsObject<RegisterResponseModel> {
  String status, message;

  RegisterResponseModel({this.status, this.message});

  @override
  RegisterResponseModel fromMap(dynamicData) {
    // TODO: implement fromMap
    if (dynamicData != null) {
      return RegisterResponseModel(
          status: dynamicData['status'], message: dynamicData['message']);
    } else {
      return null;
    }
  }

  @override
  List<RegisterResponseModel> fromMapList(List<dynamic> dynamicDataList) {
    // TODO: implement fromMapList
    throw UnimplementedError();
  }

  @override
  String getPrimaryKey() {
    // TODO: implement getPrimaryKey
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap(RegisterResponseModel object) {
    // TODO: implement toMap
    if (object != null) {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['status'] = object.status;
      data['message'] = object.message;
    } else {
      return null;
    }
  }

  @override
  List<Map<String, dynamic>> toMapList(List<RegisterResponseModel> objectList) {
    // TODO: implement toMapList
    throw UnimplementedError();
  }
}

class RegisterRequestModel extends PsObject<RegisterRequestModel> {
  String username, grant_type, password, scope;

  RegisterRequestModel(
      {this.username, this.grant_type, this.password, this.scope});

  @override
  RegisterRequestModel fromMap(dynamicData) {
    // TODO: implement fromMap
    if (dynamicData != null) {
      return RegisterRequestModel(
          username: dynamicData['username']?? "keylife",
          grant_type: dynamicData['grant_type'] ??"password",
          password: dynamicData['password']??"Aa_123456",
          scope: dynamicData['scope']?? "");
    } else {
      return null;
    }
  }

  @override
  List<RegisterRequestModel> fromMapList(List<dynamic> dynamicDataList) {
    // TODO: implement fromMapList
    throw UnimplementedError();
  }

  @override
  String getPrimaryKey() {
    // TODO: implement getPrimaryKey
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toMap(RegisterRequestModel object) {
    // TODO: implement toMap
    if (object != null) {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['username'] = object.username;
      data['grant_type'] = object.grant_type;
      data['password'] = object.password;
      data['scope'] = "";
    } else {
      return null;
    }
  }

  @override
  List<Map<String, dynamic>> toMapList(List<RegisterRequestModel> objectList) {
    // TODO: implement toMapList
    throw UnimplementedError();
  }
}
