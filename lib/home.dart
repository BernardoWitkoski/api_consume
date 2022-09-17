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
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => cepRequest()));
            }, style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 46, 44, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 15.0,
                      ), child: Text("Consultar CEP"),
                    ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:  (context) => weatherRequest()));
            }, style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 46, 44, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 15.0,
                      ), child: Text("Consultar Clima"),
                    ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:  (context) => btcRequest()));
            }, style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 46, 44, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 15.0,
                      ), child: Text("Consultar BTC"),
                    ),
          ],
          ),
        ),
      );
  }
}