import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:self_learn5/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:self_learn5/provider/product_provider.dart';



class ProductProvider extends ChangeNotifier{
      List<ProductModel> cartItem = [];


        ProductProvider(){
            loadCart();
        }

        Future<void> addToCart(ProductModel products)async{
              cartItem.add(products);
              
            await saveCart();
            notifyListeners();
        }


        Future<void> removeFromCart(int index)async{
            cartItem.removeAt(index);
            await saveCart();
            notifyListeners();
        }


        // Caculatr total price
        double get TotalPrice{
            return cartItem.fold(0, 
            (sum, max) => sum + max.price,
            );
        } 

        

        Future<void> saveCart()async{
              SharedPreferences prefs = await SharedPreferences.getInstance();

              await prefs.setString('cart', ProductModel.encoded(cartItem));


        }


        Future<void> loadCart()async{
              SharedPreferences prefs = await SharedPreferences.getInstance();

              String? data = await prefs.getString('cart');


              if(data !=null){
                  cartItem = ProductModel.decoded(data);
                  notifyListeners();
              }
        }

        
}
