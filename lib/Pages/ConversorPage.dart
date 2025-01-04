import 'dart:io';
import 'package:async/async.dart';
import 'package:conversor_de_moeda/Pages/pageInConnect.dart';
import 'package:conversor_de_moeda/Util/HttpRequest.dart';
import 'package:flutter/material.dart';

Uri request = Uri(
  scheme: 'https',
  host: 'api.hgbrasil.com',
  path: '/finance',
  queryParameters: {'key': '6f23de08'},
);

class Conversor extends StatefulWidget {
  const Conversor({super.key});

  @override
  State<Conversor> createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Conversor De moeda"),
        centerTitle: true,
        backgroundColor: Color(0xFFFFD700),
      ),
      body: FutureBuilder<Map>(
        future: getResponse().tResponse(request),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  "Carregando dados ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "erro ao carregar dados",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              } else {

                return Carregado(cotacao: snapshot.data);
              }
          }
        },
      ),
    );
  }
}
