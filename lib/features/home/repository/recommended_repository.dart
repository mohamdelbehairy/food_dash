import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_dash/features/home/model/categories_model.dart';
import 'package:food_dash/features/home/model/product_model.dart';

class RecommendedRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoriesModel>> fetchCategories() async {
    final categoriesSnapshot = await _firestore.collection('categories').get();
    return categoriesSnapshot.docs
        .map((doc) => CategoriesModel.fromMap(doc.data()))
        .toList();
  }
Future<List<ProductsModel>> fetchProductsForCategory({int categoryId=0}) async {
  if (categoryId == 0) {
    // Fetch all products across all categories
    List<ProductsModel> allProducts = [];
    final categoriesSnapshot = await _firestore.collection('categories').get();

    for (var categoryDoc in categoriesSnapshot.docs) {
      final productsSnapshot = await categoryDoc.reference.collection('products').get();
      allProducts.addAll(
        productsSnapshot.docs.map((doc) => ProductsModel.fromMap(doc.data())).toList(),
      );
    }

    print("Total number of products fetched: ${allProducts.length}");
    return allProducts;
  } else {
    // Fetch products for a specific category
    final categoryQuerySnapshot = await _firestore
        .collection('categories')
        .where('category_id', isEqualTo: categoryId)
        .get();

    if (categoryQuerySnapshot.docs.isNotEmpty) {
      final categoryDoc = categoryQuerySnapshot.docs.first;
      final productsSnapshot = await categoryDoc.reference.collection('products').get();

      print("Number of products in category $categoryId: ${productsSnapshot.docs.length}");
      return productsSnapshot.docs
          .map((doc) => ProductsModel.fromMap(doc.data()))
          .toList();
    } else {
      print("No products found for category $categoryId");
      return [];
    }
  }
}

  // Future<List<ProductsModel>> fetchProductsForCategory(int categoryId) async {
  //   if (categoryId == 0) {
  //     // Fetch all products when categoryId is 0
  //     final productsSnapshot = await _firestore.collection('products').get();
  //     return productsSnapshot.docs
  //         .map((doc) => ProductsModel.fromMap(doc.data()))
  //         .toList();
  //   } else {
  //     // Fetch products for a specific category
  //     final categoryQuerySnapshot = await _firestore
  //         .collection('categories')
  //         .where('category_id', isEqualTo: categoryId)
  //         .get();

  //     if (categoryQuerySnapshot.docs.isNotEmpty) {
  //       final categoryDoc = categoryQuerySnapshot.docs.first;
  //       final productsSnapshot =
  //           await categoryDoc.reference.collection('products').get();

  //       return productsSnapshot.docs
  //           .map((doc) => ProductsModel.fromMap(doc.data()))
  //           .toList();
  //     } else {
  //       return [];
  //     }
  //   }
  // }

  Future<List<ProductsModel>> fetchAllProducts() async {
    final productsSnapshot = await _firestore.collection('products').get();
    return productsSnapshot.docs
        .map((doc) => ProductsModel.fromMap(doc.data()))
        .toList();
  }
}
