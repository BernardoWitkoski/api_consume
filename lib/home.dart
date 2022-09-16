import 'package:api_consume/btcRequest.dart';
import 'package:api_consume/cepRequest.dart';
import 'package:api_consume/weatherRequest.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Utilities APP"),
        backgroundColor: Color.fromARGB(255, 46, 44, 44),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => cepRequest()));
            }, child: Text("Consultar CEP")),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:  (context) => weatherRequest()));
            }, child: Text("Consultar clima")),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:  (context) => btcRequest()));
            }, child: Text("Consultar BTC")),
          ],
        ),
      );
  }
}