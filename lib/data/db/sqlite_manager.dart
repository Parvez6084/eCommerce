
import 'package:todo/model/product_model.dart';

abstract class SQLiteManager{

  Future<int> insertItem(String tableName, Map<String, dynamic> toMap);
  Future<int> deleteAllData(String tableName);
  Future<int> deleteProductById(int id);
  Future<List<ProductModel>>getAllCartProduct();

}