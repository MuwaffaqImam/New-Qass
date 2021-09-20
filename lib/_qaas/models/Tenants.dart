class Tenant {
  String id;
  String name;
  String email;
  String phone;
  int lon;
  int lat;
  String categoryId;
  Category category;
  String image;
  String logo;

  Tenant(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.lon,
        this.lat,
        this.categoryId,
        this.category,
        this.image,
        this.logo});

  Tenant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    lon = json['lon'];
    lat = json['lat'];
    categoryId = json['categoryId'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    image = json['image'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    data['categoryId'] = this.categoryId;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['image'] = this.image;
    data['logo'] = this.logo;
    return data;
  }
}

class Category {
  String id;
  String name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
