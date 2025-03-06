import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mycart/core/exceptions.dart';
import 'package:mycart/product/data/product_response_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductResponseModel> getProducts({required int limit});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<ProductResponseModel> getProducts({required int limit}) =>
      _getProductFromUrl('https://dummyjson.com/products?limit=$limit');

  Future<ProductResponseModel> _getProductFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return ProductResponseModel.fromJson(
        json.decode(response.body)['products'],
      );
    } else {
      throw ServerException();
    }
  }
}
