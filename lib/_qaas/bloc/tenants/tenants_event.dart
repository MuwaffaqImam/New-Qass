part of 'tenants_bloc.dart';

@immutable
abstract class TenantsEvent {}

class TenantList extends TenantsEvent {}

class TenantBranches extends TenantsEvent {
  final String id;
  TenantBranches(this.id);
}

class TenantServices extends TenantsEvent {}
