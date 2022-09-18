import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class btcRequest extends StatefulWidget {
  const btcRequest({Key? key}) : super(key: key);

  @override
  State<btcRequest> createState() => _btcRequestState();
}

class _btcRequestState extends State<btcRequest> {

  _recuperaCep() async {


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BTC & Dollar Request"),
        backgroundColor: Color.fromARGB(255, 46, 44, 44),
      ),
    );
  }
}