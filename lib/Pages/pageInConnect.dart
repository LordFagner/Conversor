import 'package:flutter/material.dart';

class Carregado extends StatefulWidget {

  Map<dynamic, dynamic>? cotacao;

  Carregado({super.key, required this.cotacao});

  @override
  State<Carregado> createState() => _CarregadoState();
}

class _CarregadoState extends State<Carregado> {
  late Map<dynamic, dynamic> safeCotacao;
  late double dolar;
  late double euro;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    safeCotacao = widget.cotacao ?? {};
    dolar = safeCotacao["results"]?["currencies"]?["USD"]?["buy"] ?? 0.0 ;
    euro = safeCotacao["results"]?["currencies"]?["EUR"]?["buy"] ?? 0.0 ;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.monetization_on),
          Text(
            "${euro}  ",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
