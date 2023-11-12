import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/data/db/sqlite_manager.dart';
import 'package:todo/data/db/sqlite_table.dart';
import 'package:todo/model/product_model.dart';
import 'package:todo/services/local_notification.dart';

class DetailsController extends GetxController{

  ProductModel args  = Get.arguments;
  var productQuantity = 1.obs;
  var selectedProduct = ProductModel().obs;
  final SQLiteManager dbManager = Get.find(tag: (SQLiteManager).toString());


  void removeItem(){
    if(productQuantity > 1){
      productQuantity--;
    }
  }

  void selectedAddToCart(BuildContext context){
    selectedProduct.value = args;
    selectedProduct.value.quantity = productQuantity.value;

    dbManager.insertItem(tableProduct, selectedProduct.value.toJson()).then((value){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Successfuly add to cart!!')));
      Get.back();
    });

  }



}