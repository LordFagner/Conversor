import 'package:flutter/material.dart';
import 'Pages/ConversorPage.dart';
import 'package:http/http.dart' as Http;
import 'package:async/async.dart';
import "dart:convert";


void main() async {

  runApp(
    MaterialApp(
      home: Conversor(),
    ),
  );
}

