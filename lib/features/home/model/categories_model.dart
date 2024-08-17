
class CategoriesModel {
  final int? category_id;
  final String? category_name;
  final String? category_image;
  final String? category_color;


  CategoriesModel(
      {this.category_id, this.category_image, this.category_name,this.category_color});

       factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      category_id: map['category_id'],
      category_name: map['category_name'],
      category_image: map['category_image'],
      category_color: map['category_color'],
    );
  }
 
}
