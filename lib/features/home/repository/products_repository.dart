import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_dash/constants.dart';
import 'package:food_dash/features/home/model/product_model.dart';

class ProductsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<ProductsModel> discountedProducts = [];
  Future<List<ProductsModel>> getDiscountedProducts() async {
    final categoriesSnapshot = await _firestore.collection('categories').get();
    for (var categoryDoc in categoriesSnapshot.docs) {
      // Check if the 'products' subcollection exists
      if (await categoryDoc.reference
          .collection('products')
          .get()
          .then((snapshot) => snapshot.docs.isNotEmpty)) {
        final productsSnapshot = await categoryDoc.reference
            .collection('products')
            .where('discountRatio', isNotEqualTo: 0)
            .get();
        for (var productDoc in productsSnapshot.docs) {
          final productData = productDoc.data();
          print('productData $productData');
          Map<String, dynamic> productMap = {
            'discountRatio': productData['discountRatio'] ?? 0.0,
            'distance': productData['distance'] ?? 0.0,
            'image': productData['image'] ?? Constants.userDataViewImageUrl,
            'isFavourite': productData['isFavourite'] ?? false,
            'price': productData['price'] ?? 0.0,
            'product_name': productData['product_name'] ?? "",
            'rate': productData['rate'] ?? 0.0,
            'rateCount': productData['rateCount'] ?? 0,
          };
          
          print('productMap $productMap');
          final  productsModel = ProductsModel.fromMap(productMap );
          print('productsModel $productsModel');
          discountedProducts.add(productsModel);
          print('discountedProducts $discountedProducts');
        }
      }
    }
    print('products here $discountedProducts');
    return discountedProducts;
  }
}
