import 'dart:convert';

class ProductModel{
      final String name;
      final double price;


      ProductModel({
        required this.name,
        required this.price,
      });

      Map<String, dynamic> toJson(){
          return {
              'name' : name,
              'price' : price,
          };
      }


      factory ProductModel.fromJson(Map<String,dynamic> json){
          return ProductModel(
            name: json['name'],
             price: json['price']
             );
      }


      // encoded data from Json api
      static String encoded(List<ProductModel> products) => json.encode(products.map((e) => e.toJson())..toList());

      // decoded data from API
     static List<ProductModel> decoded(String products)=> (json.decode(products) as List<dynamic>).map((e) => ProductModel.fromJson(e)).toList();



}
