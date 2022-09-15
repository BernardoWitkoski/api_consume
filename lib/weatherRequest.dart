import 'package:flutter/material.dart';

class weatherRequest extends StatefulWidget {
  const weatherRequest({Key? key}) : super(key: key);

  @override
  State<weatherRequest> createState() => _weatherRequestState();
}

class _weatherRequestState extends State<weatherRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Request"),
      ),
    );
  }
}