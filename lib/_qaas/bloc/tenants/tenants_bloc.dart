import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:food_template/_qaas/models/Branch.dart';
import 'package:food_template/_qaas/models/Service.dart';
import 'package:food_template/_qaas/models/Tenants.dart';
import 'package:food_template/_qaas/models/Tickets.dart';
import 'package:food_template/_qaas/network/Api.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'tenants_event.dart';

part 'tenants_state.dart';

class TenantsBloc extends Bloc<TenantsEvent, TenantsState> {
  TenantsBloc() : super(Loading());

  @override
  Stream<TenantsState> mapEventToState(
    TenantsEvent event,
  ) async* {
    if (event is TenantList) yield* _mapTenantsListToState();
    if (event is TenantBranches) yield* _mapTenantsBranchesToState(event);
    if (event is TenantServices) yield* _mapServiceToState(event);
    if (event is SendTickets) yield* _mapSendTicketsToState(event);
  }

  Stream<TenantsState> _mapSendTicketsToState(SendTickets event) async* {
    yield Loading();
    try {
      final Ticket ticket = await fetchTickets(
          serviceId: event.serviceId, locationId: event.locationId);
      yield TicketsSuccess(ticket);
    } catch (_) {
      print('$_');
      yield Failure();
    }
  }

  Stream<TenantsState> _mapServiceToState(TenantServices event) async* {
    yield Loading();
    try {
      final List<ServiceProvided> services =
          await fetchServices(event.branchId);
      yield ServicesSuccess(services);
    } catch (_) {
      yield Failure();
    }
  }

  Stream<TenantsState> _mapTenantsBranchesToState(TenantBranches event) async* {
    yield Loading();
    // try {
    final List<Branch> branches = await fetchTenantBranches(event.tenantId);
    yield TenantsBranchesSuccess(branches);
    // } catch (_) {
    //   yield Failure();
    // }
  }

  Future<Ticket> fetchTickets(
      {String serviceId, String locationId, int type = 0}) async {
    print('PostTicket ....');
    final response = await http.post('${Api.BASE_URL}${Api.POST_TICKETS}',
        headers: {
          "content-type": "application/json",
          'authorization': await Api.buildingBearerAuthorization()
        },
        body: jsonEncode({
          "serviceId": "$serviceId",
          "location": "$locationId",
          "phone": "string",
          "ticketType": 0
        }));
    print("Requesting ...");
    print(response.request.url);
    print('response.body');
    print(response.body);
    if (response.statusCode == 200) {
      return Ticket.fromJson(json.decode(response.body));
    }
    throw Exception('error');
  }

  Future<List<ServiceProvided>> fetchServices(String tenantId) async {
    print('fetching fetchServices ....');
    final response = await http.get(
      '${Api.BASE_URL}${Api.GET_BRANCHES}$tenantId${Api.GET_SERVICES}',
    );
    print("Requesting ...");
    print(response.request.url);
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        print(json);
        return ServiceProvided.fromJson(json);
      }).toList();
    }
    print('response.body');
    print(response.body);
    throw Exception('error');
  }

  Future<List<Branch>> fetchTenantBranches(String tenantId) async {
    print('fetching tenants Branches....');
    final response = await http.get(
      '${Api.BASE_URL}${Api.GET_BRANCHES}$tenantId${Api.GET_TENANTS}',
    );
    print("Requesting ...");
    print(response.request.url);
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        print(json);
        return Branch.fromJson(json);
      }).toList();
    }
    print(response.body);
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
  final response = await http.get('${Api.BASE_URL}${Api.GET_TENANTS}');
  print("Requesting ...");
  print(response.request.url);
  if (response.statusCode == 200) {
    final body = json.decode(response.body) as List;
    return body.map((dynamic json) {
      print(json);
      return Tenant.fromJson(json);
    }).toList();
  }
  throw Exception('error');
}
