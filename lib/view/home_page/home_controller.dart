import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo/model/product_model.dart';
import 'package:todo/services/remote_services.dart';


class HomeController extends GetxController{

  TextEditingController searchController = TextEditingController();
  RxList<ProductModel> rxProductList = RxList.empty();
  List<ProductModel> get productList => rxProductList.toList();

  void getAllProduct()async{
    List<ProductModel> listOfProduct = await RemoteServices.getAllProductList();
    rxProductList.addAll(listOfProduct);
  }

  @override
  void onInit() {
    super.onInit();
    getAllProduct();
  }

}