import 'package:flutter/material.dart';
import 'Tela_inicial.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'TradeWinds',
      ),
      home: TelaInicial(),
    );
  }
}