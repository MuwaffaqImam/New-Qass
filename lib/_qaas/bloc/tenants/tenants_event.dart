part of 'tenants_bloc.dart';

@immutable
abstract class TenantsEvent {}

class TenantList extends TenantsEvent {}

class TenantBranches extends TenantsEvent {
  final String tenantId;

  TenantBranches(this.tenantId);
}

class TenantServices extends TenantsEvent {
  final String branchId;

  TenantServices(this.branchId);
}

class SendTickets extends TenantsEvent {
  final String serviceId, locationId;
  SendTickets({this.serviceId, this.locationId});
}
