import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class weatherRequest extends StatefulWidget {
  const weatherRequest({Key? key}) : super(key: key);

  @override
  State<weatherRequest> createState() => _weatherRequestState();
}

class _weatherRequestState extends State<weatherRequest> {

  String _resultado = "standard string";

  Future _requestWeather() async {

    // https://api.hgbrasil.com/weather?woeid=457152

    var uri = Uri.http("api.hgbrasil.com", "/weather?woeid=457152");

    http.Response response;

    response = await http.get(uri);

    if(response.statusCode == 200) {

      Map<String, dynamic> request_return = convert.jsonDecode(response.body);

       String city = request_return["city"];


      setState(() {
        _resultado = "${city}";
      });
    } else {
      print("Error ${response.statusCode.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Request"),
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