

import 'package:flutter/material.dart';

class SepetModel with ChangeNotifier{
  final String cartId;
  final String productId;
  final int quantity;


SepetModel({
    required this.cartId,
    required this.productId,
    required this.quantity,

  });
}