import 'package:flutter/material.dart';
import 'package:prime_tach/models/product_detiles_model.dart';
class ProductDetiels extends StatefulWidget {
  Payload  payload;
  ProductDetiels(this.payload);
  @override
  _ProductDetielsState createState() => _ProductDetielsState();
}

class _ProductDetielsState extends State<ProductDetiels> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product detiels"),
      ),
      body: Center(
        child:Text(widget.payload.id.toString()) ,
      )

    );
  }
}
