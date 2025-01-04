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
  final TextEditingController _RealC = TextEditingController();
  final TextEditingController _DolarC = TextEditingController();
  final TextEditingController _EuroC = TextEditingController();

  void _RealChanged(String text) {
    if(text.isEmpty){
      _ClearAll();
    }
    double real = double.parse(text);
    _DolarC.text = (real/dolar).toStringAsFixed(2);
    _EuroC.text = (real/dolar).toStringAsFixed(2);
  }

  void _DolarChanged(String text) {
    if(text.isEmpty){
      _ClearAll();
    }
    double dolar = double.parse(text);
    _RealC.text = (dolar * this.dolar).toStringAsFixed(2);
    _EuroC.text = (dolar * this.dolar/euro).toStringAsFixed(2);
  }

  void _ClearAll(){
    _RealC.text = "";
    _DolarC.text = "";
    _EuroC.text = "";


  }
  void _EuroChanged(String text) {
    if (text.isEmpty) {
      _ClearAll();
    }
    double euro = double.parse(text);
    _RealC.text = (euro * this.euro).toStringAsFixed(2);
    _DolarC .text = (euro * this.euro/dolar).toStringAsFixed(2);
  }

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
            BuildTextFiled("Dolar", "\$", _DolarC,_DolarChanged),
            BuildTextFiled("Real", "R\$", _RealC,_RealChanged),
            BuildTextFiled("Euro", "\€", _EuroC,_EuroChanged),
          ],
        ),
      ),
    );
  }
}

Widget BuildTextFiled(
    String text, String prefix, TextEditingController c, Function f) {
  return TextField(
    controller: c,
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
    onChanged: (value) => f(value),
    keyboardType: TextInputType.numberWithOptions(decimal: true),
  );
}
