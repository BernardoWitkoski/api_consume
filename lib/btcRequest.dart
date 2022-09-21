import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class btcRequest extends StatefulWidget {
  const btcRequest({Key? key}) : super(key: key);

  @override
  State<btcRequest> createState() => _btcRequestState();
}

class _btcRequestState extends State<btcRequest> {

  String _resultado = "standard string";

  Future _recuperaCep() async {

    // URL base = https://economia.awesomeapi.com.br/json/last/BTC-BRL
    // URL base  = https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false

    //var uri = Uri.http("economia.awesomeapi.com.br", "awesomeapi.com.br/json/last/BTC-BRL");

    var uri = Uri.parse('economia.awesomeapi.com.br/json/last/BTC-BRL');

    http.Response response;

    response = await http.get(uri);

    if(response.statusCode == 200) {

      Map<String, dynamic> request_return = convert.jsonDecode(response.body);

      String name = request_return["name"];

      setState(() {
        _resultado = "${name}";
      });
    } else {
      print("Error ${response.statusCode.toString()}");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BTC & Dollar Request"),
        backgroundColor: Color.fromARGB(255, 46, 44, 44),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
          Text(_resultado),
          ]),
        ),
    );
  }
}