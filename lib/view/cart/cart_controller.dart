import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/data/db/sqlite_manager.dart';
import 'package:todo/data/db/sqlite_table.dart';
import 'package:todo/model/product_model.dart';

class CartController extends GetxController{

  RxList<ProductModel> rxCartList =RxList.empty();
  final SQLiteManager dbManager = Get.find(tag: (SQLiteManager).toString());

  void getCardList(){
    dbManager.getAllCartProduct().then((value){
      rxCartList.assignAll(value);
    });
  }

  @override
  void onInit() {
    super.onInit();
    getCardList();
  }

  double totalPrice(int index){
    int qn = rxCartList.value[index].quantity!;
    double price = rxCartList.value[index].price!;
    var total = price * qn ;
    return total;
  }

  void checkOut(){
    dbManager.deleteAllData(tableProduct);
    Get.back();
  }

  void deleteItem(int id){
    dbManager.deleteProductById(id).then((value) => {
    ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(content: Text('Delete Item Success')))
    });
  }


}