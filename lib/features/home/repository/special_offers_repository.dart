import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_dash/core/utils/constants.dart';
import 'package:food_dash/features/home/model/product_model.dart';

class SpecialOffersRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getSpecialOffers() async {
    final List<Map<String, dynamic>> specialOffers = [];
    final categoriesSnapshot = await _firestore.collection('categories').get();
    for (var categoryDoc in categoriesSnapshot.docs) {
      final categoryMap = categoryDoc.data();
      final categoryId = categoryMap['category_id'];
      final categoryName = categoryMap['category_name'] as String;
      final categoryImage = categoryMap['category_image'] as String;
      final categoryColor = categoryMap['category_color'] as String? ?? '#FFFFFF';

      // Check if the 'products' subcollection exists
      if (await categoryDoc.reference
          .collection('products')
          .get()
          .then((snapshot) => snapshot.docs.isNotEmpty)) {
        final productsSnapshot = await categoryDoc.reference
            .collection('products')
            .where('discountRatio', isNotEqualTo: 0)
            .get();

        final List<ProductsModel> discountedProducts = [];
        for (var productDoc in productsSnapshot.docs) {
          final productData = productDoc.data();
          final productMap = {
            'discountRatio': productData['discountRatio'] ?? 0.0,
            'distance': productData['distance'] ?? 0.0,
            'image': productData['image'] ?? Constants.userDataViewImageUrl,
            'isFavourite': productData['isFavourite'] ?? false,
            'price': productData['price'] ?? 0.0,
            'product_name': productData['product_name'] ?? "",
            'rate': productData['rate'] ?? 0.0,
            'rateCount': productData['rateCount'] ?? 0,
          };
          final productsModel = ProductsModel.fromMap(productMap);
          discountedProducts.add(productsModel);
        }

        if (discountedProducts.isNotEmpty) {
          specialOffers.add({
            'categoryId': categoryId,
            'categoryName': categoryName,
            'categoryImage': categoryImage,
            'discountedProducts': discountedProducts,
            'categoryColor':categoryColor,
          });
        }
      }
    }
    print('specialOffers: $specialOffers');
    return specialOffers;
  }
}
