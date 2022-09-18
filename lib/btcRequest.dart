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

  _recuperaCep() async {

    // URL base = https://economia.awesomeapi.com.br/json/last/BTC-BRL

    var uri = Uri.http("economia.awesomeapi.com.br", "/json/last/BTC-BRL");

    http.Response response;

    response = await http.get(uri);

    if(response.statusCode == 200) {
      //show content
      Map<String, dynamic> request_return = convert.jsonDecode(response.body);

      String code = request_return["code"];
      String codein = request_return["codein"];
      String name = request_return["name"];
      String bid = request_return["bid"];
      String createDate = request_return["create_date"];

      setState(() {
        _resultado = "${code} ${codein} ${name} ${bid} ${createDate}";
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
      body: Padding(
            padding: EdgeInsets.all(16),
            child: Text(_resultado),
          ),
    );
  }
}