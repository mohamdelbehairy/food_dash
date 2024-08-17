import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_dash/features/home/model/categories_model.dart';

class CategoryRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoriesModel>> getCategories() async {
    final snapshot = await _firestore
        .collection('categories')
        .orderBy('category_id', descending: false)
        .get();
    return snapshot.docs
        .map((doc) => CategoriesModel.fromMap({
              'category_id': doc.data()['category_id'],
              'category_image': doc.data()['category_image'],
              'category_name': doc.data()['category_name'],
              'category_color': doc.data()['category_color'],
            }))
        .toList();
  }
}
