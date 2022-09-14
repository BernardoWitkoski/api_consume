import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperaCep() async {
    String cep = "99700000";
    // URL base = "https://viacep.com.br/ws/${cep}/json/";

    var uri = Uri.http("https://viacep.com.br/ws/${cep}/json/", "/ws/${cep}/json/");

    http.Response response;

    response = await http.get(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
    );
  }
}