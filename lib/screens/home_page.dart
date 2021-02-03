

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:prime_tach/display_size_helper/display_size_helper.dart';
import 'package:prime_tach/providers/product_data_provider.dart';
import 'package:prime_tach/screens/product_detiles_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  var _isLoading = false;
  void initState() {
    // TODO: implement initState
    _isLoading = true;
    Provider.of<ProductDataProvider>(context, listen: false)
        .getlist().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    final snapshot = Provider.of<ProductDataProvider>(context).getProduct;
    var product=snapshot;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: _isLoading?
          Center(
            child: CircularProgressIndicator(),
          )
      :
    ListView.builder(
        itemCount: product.payload.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.only(left:16.0,top: 5,right: 16),
            child: GestureDetector(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>
                ProductDetiels(product.payload[index])
                ));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: Row(
                        children: [
                          Text(
                              product.payload[index].assemblyId.toString()
                          ),
                          SizedBox(width: 5,),
                          Text(
                              product.payload[index].name
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: SizedBox(
                        width: displayWidth(context)*0.4,
                        child: Text(
                          product.payload[index].description
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:12.0),
                      child: SizedBox(
                        width: displayWidth(context)*0.3,
                        child: Text(
                            product.payload[index].cost.toString()
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                elevation: 4,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          );

        }
    )

    );
  }
}
