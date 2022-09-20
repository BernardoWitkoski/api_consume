import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class cepRequest extends StatefulWidget {
  const cepRequest({Key? key}) : super(key: key);

  @override
  State<cepRequest> createState() => _cepRequestState();
}

class _cepRequestState extends State<cepRequest> {

  TextEditingController _controllerCep = TextEditingController();
  String _resultado = "standard string";

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

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CEP Request"),
        backgroundColor: Color.fromARGB(255, 46, 44, 44),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Digite o CEP, ex: 99770000"),
              style: TextStyle(fontSize: 22),
              controller: _controllerCep,
            ),
            ElevatedButton(
              onPressed: _recuperaCep, 
              style: ElevatedButton.styleFrom(
                        minimumSize: Size(380, 50),
                        primary: Color.fromARGB(255, 46, 44, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 15.0,
                      ),
              child: Text("Buscar Cidade")
              ),
              Text(_resultado),
          ]),
      ),
    );
  }
}