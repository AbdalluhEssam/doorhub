class CategoriesModel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? catServices;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatetime,
      this.catServices});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'].toString();
    categoriesName = json['categories_name'].toString();
    categoriesNameAr = json['categories_name_ar'].toString();
    categoriesImage = json['categories_image'].toString();
    categoriesDatetime = json['categories_datetime'].toString();
    catServices = json['cat_services'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    data['cat_services'] = this.catServices;
    return data;
  }
}
