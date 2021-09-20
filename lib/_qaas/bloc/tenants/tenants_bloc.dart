import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:food_template/_qaas/models/Branch.dart';
import 'package:food_template/_qaas/models/Tenants.dart';
import 'package:food_template/_qaas/network/Api.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'tenants_event.dart';

part 'tenants_state.dart';

class TenantsBloc extends Bloc<TenantsEvent, TenantsState> {
  TenantsBloc() : super(Loading());

  @override
  Stream<TenantsState> mapEventToState(TenantsEvent event,) async* {
    if (event is TenantsEvent) yield* _mapTenantsListToState();
    if (event is TenantBranches) yield* _mapTenantsBranchesToState(event);
  }

  Stream<TenantsState> _mapTenantsBranchesToState(TenantBranches event) async* {
    yield Loading();
    try {
      final List<Branch> branches = await fetchTenantBranches(event.id);
      yield TenantsBranchesSuccess(branches);
    } catch (_) {
      yield Failure();
    }
  }

  Future<List<Branch>> fetchTenantBranches(String tenantId) async {
    print('fetching tenants Branches....');
    final response = await http.get(
      Uri.https(
          Api.BASE_URL,
          '${Api.GET_BRANCHES}$tenantId${Api.GET_TENANTS}',
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        print(json);
        return Branch.fromJson(json);
      }).toList();
    }
    throw Exception('error');
  }
}


Stream<TenantsState> _mapTenantsListToState() async* {
  yield Loading();
  try {
    final List<Tenant> tenants = await fetchTenant();
    yield TenantsSuccess(tenants);
  } catch (_) {
    yield Failure();
  }
}

Future<List<Tenant>> fetchTenant() async {
  print('fetching tenants ....');
  final response = await http.get(
    Uri.https(
      Api.BASE_URL,
      Api.GET_TENANTS,
    ),
  );
  if (response.statusCode == 200) {
    final body = json.decode(response.body) as List;
    return body.map((dynamic json) {
      print(json);
      return Tenant.fromJson(json);
    }).toList();
  }
  throw Exception('error');
}

