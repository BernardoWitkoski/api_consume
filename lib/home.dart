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
        title: Text(
          'Utilities API',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        backgroundColor: Color.fromARGB(255, 46, 44, 44),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_sharp),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                    child: 
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => cepRequest()));
                        }, style: ElevatedButton.styleFrom(
                            minimumSize: Size(380, 50),
                            primary: Color.fromARGB(255, 46, 44, 44),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 15.0,
                          ), child: Text("Consultar CEP"),
                      ),
                    ),
                Padding(
                  padding: EdgeInsets.all(5),
                    child:
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:  (context) => weatherRequest()));
                        }, style: ElevatedButton.styleFrom(
                            minimumSize: Size(380, 50),
                            primary: Color.fromARGB(255, 46, 44, 44),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 15.0,
                          ), child: Text("Consultar Clima"),
                      ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                    child:
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:  (context) => btcRequest()));
                        }, style: ElevatedButton.styleFrom(
                            minimumSize: Size(380, 50),
                            primary: Color.fromARGB(255, 46, 44, 44),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 15.0,
                          ), child: Text("Consultar BTC"),
                      ),
                ),
              ],
            ),
          ),
          ),
        ),
      );
  }
}