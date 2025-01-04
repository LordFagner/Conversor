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
    dolar = safeCotacao["results"]?["currencies"]?["USD"]?["buy"] ?? 0.0;
    euro = safeCotacao["results"]?["currencies"]?["EUR"]?["buy"] ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          spacing: 40,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.monetization_on,
              color: Colors.amber,
              size: 120,
            ),
            BuildTextFiled("Dolar", "\$"),
            BuildTextFiled("Real", "R\$"),
            BuildTextFiled("Euro", "\€"),
          ],
        ),
      ),
    );
  }
}

Widget BuildTextFiled(String text, String prefix) {
  return TextField(
    decoration: InputDecoration(
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.amber,
        fontSize: 25,
      ),
      hoverColor: Colors.amber,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.white)),
      prefixText: prefix,
      prefixStyle: TextStyle(
          color: Colors.amber, fontSize: 25, decorationColor: Colors.amber),
    ),
    style: TextStyle(
      color: Colors.amber,
    ),
  );
}
