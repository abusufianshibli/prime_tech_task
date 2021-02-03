import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:prime_tach/models/product_detiles_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class ProductDataProvider with ChangeNotifier{
  ProductResponseModel productResponseModel;
  ProductResponseModel get getProduct{
    if(productResponseModel != null){
      return productResponseModel;
    }
  }

  Future<ProductResponseModel> getlist()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userToken= await prefs.getString("userToken");

    var getproducturl="https://webhooktest61.advanceprotech.com/api/products";
    var getresponse=await http.get(getproducturl,headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $userToken",
    });
    print(getresponse.body);
    print(userToken);
    ProductResponseModel getProductResponse=ProductResponseModel.fromJson(jsonDecode(getresponse.body));
    productResponseModel=getProductResponse;
    notifyListeners();

  }

}