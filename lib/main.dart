import 'package:flutter/material.dart';
import 'package:prime_tach/auth_page/login_page.dart';
import 'package:prime_tach/providers/product_data_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:
      [
        ChangeNotifierProvider(create: (context) =>ProductDataProvider()),
      ],
      child:  MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
      ),

    );
  }
}
