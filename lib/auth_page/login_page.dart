import 'dart:convert';

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prime_tach/display_size_helper/display_size_helper.dart';
import 'package:prime_tach/models/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:prime_tach/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController Password = TextEditingController();
  bool _passwordhide = true;
  Future <LoginTokenResponse> login()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url="https://webhooktest61.advanceprotech.com/api/Authenticate/login";
    var postrequest=await http.post(url,body: jsonEncode(
        {
          "username": userName.text,
          "password": Password.text,
        }
    ),
        headers: {"content-type": "application/json"});
    print(postrequest.body);
    if(postrequest.statusCode==200){
    LoginTokenResponse loginTokenResponse=LoginTokenResponse.fromJson(jsonDecode(postrequest.body));
    var userToken=loginTokenResponse.successResonse.token;
    await prefs.setString("userToken", userToken);
    print(userToken);
    Fluttertoast.showToast(msg: "Log in Successfull",fontSize: 20,backgroundColor:Colors.blue,textColor: Colors.white,);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
    }
    else{
      Fluttertoast.showToast(msg: "Log in Failed",fontSize: 20,backgroundColor:Colors.red,textColor: Colors.white,);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              child: SvgPicture.asset(
                'images/loginsvg.svg',
                width: 400,
                height: 150,
                color: Colors.blue,
              )),
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: displayHeight(context) * .2,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                    ),
                    SizedBox(
                      height: displayHeight(context) * .1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30, bottom: 20, top: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        controller: userName,
                        decoration: InputDecoration(
                            labelText: 'User Name',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide()),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide()),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.red))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30, bottom: 20, top: 20),
                      child: TextFormField(
                        controller: Password,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        obscureText: _passwordhide,
                        decoration: InputDecoration(
                            labelText: 'Enter Password',
                            suffixIcon: IconButton(
                              color: Colors.blue,
                              icon: Icon(_passwordhide
                                  ? FeatherIcons.eyeOff
                                  : FeatherIcons.eye),
                              onPressed: () {
                                setState(() {
                                  _passwordhide = !_passwordhide;
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide()),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide()),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.red))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 25, 16, 0),
                      child: Container(
                        height: displayHeight(context) * .06,
                        width: displayWidth(context) * .8,
                        child: ProgressButton(
                          defaultWidget: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Poppins'),
                          ),
                          progressWidget: const CircularProgressIndicator(
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white)),
                          borderRadius: 8,
                          color: Colors.blue,
                          type: ProgressButtonType.Flat,
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              login();

                              await Future.delayed(
                                  const Duration(milliseconds:1500 ), () => 0);
                            }
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}
