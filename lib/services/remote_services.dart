import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:todo/model/product_model.dart';
import 'package:todo/utils/api_endPoint.dart';


class RemoteServices{

 static final Dio _dio = Dio(
       BaseOptions(
        baseUrl: ApiEndPoint.BASE_URL,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        )
   );


  static Future<List<ProductModel>> getAllProductList()async{
    try {
      Response response = await _dio.get(ApiEndPoint.ALL_PRODUCT_LIST);
      var result = json.encode(response.data);
      return productModelFromJson(result);

    }catch (error){
      rethrow ;
    }


  }






}