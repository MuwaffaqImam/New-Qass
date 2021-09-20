part of 'tenants_bloc.dart';

@immutable
abstract class TenantsState {}

class Loading extends TenantsState {}

class Failure extends TenantsState {}

class TenantsSuccess extends TenantsState {
  final List<Tenant> tenantsList;

  TenantsSuccess(this.tenantsList);

  Map<String, List<Tenant>> getTenentsGrouped() {
    Map<String, List<Tenant>> map = new HashMap();
    List<Tenant> categoryList = [];
    tenantsList.forEach((element) {
      var category = element?.category?.name;
      if (map.containsKey(category)) {
       categoryList =  map[category];
       categoryList.add(element);
        map.putIfAbsent(category, () => categoryList);
      } else {
        categoryList.add(element);
        map.putIfAbsent(category, () => categoryList);
      }
       categoryList = [];
    });
    return map;
  }
}

class TenantsBranchesSuccess extends TenantsState {
  final List<Branch> branchesList;

  TenantsBranchesSuccess(this.branchesList);


}
