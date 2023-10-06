import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  ApiTest()
    );
  }
}

class ApiTest extends StatelessWidget {
  const ApiTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(onPressed: (){
              getData();
          },
          child: const Text('GET API')),
        ), 
    );
  } 
}

Future getData() async{
 String  baseUrl ='http://127.0.0.1:8000/api/students';
 final response = await http.get(Uri.parse(baseUrl)); 
   if(response.statusCode == 200){
    print(response.body);
   }
   else{
    throw Exception('Failed to load data');
   }

}
