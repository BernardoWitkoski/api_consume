import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCep = TextEditingController();
  String _resultado = "...";

  _recuperaCep() async {
    String cep = _controllerCep.text;
    // URL base = "https://viacep.com.br/ws/${cep}/json/";

    var uri = Uri.http("viacep.com.br", "/ws/${cep}/json/");

    http.Response response;

    response = await http.get(uri);

    if(response.statusCode == 200) {
      //show content
      Map<String, dynamic> request_return = convert.jsonDecode(response.body);

      String logradouro = request_return["logradouro"];
      String complemento = request_return["complemento"];
      String bairro = request_return["bairro"];
      String localidade = request_return["localidade"];

      setState(() {
        _resultado = "${localidade} ${logradouro} ${bairro} ${complemento}";
      });


    } else {
      print("Error ${response.statusCode.toString()}");
    }

    // print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Digite o CEP, ex: 99770000"),
              style: TextStyle(fontSize: 22),
              controller: _controllerCep,
            ),
            ElevatedButton(
              onPressed: _recuperaCep, child: Text("Buscar Cidade")
              ),
              Text(_resultado),
          ]),
      ),
    );
  }
}