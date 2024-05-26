import 'package:flutter/material.dart';
import 'Tela_resultado.dart';

class TelaQuiz extends StatefulWidget {
  @override
  _TelaQuizState createState() => _TelaQuizState();
}

class Pergunta {
  final String pergunta;
  final List<String> respostas;
  final String respostaCorreta;
  final String imagePath;

  Pergunta({
    required this.pergunta,
    required this.respostas,
    required this.respostaCorreta,
    required this.imagePath,
  });
}
class _TelaQuizState extends State<TelaQuiz> {
  int _perguntaAtual = 0;
  int _pontuacao = 0;

    final List<Pergunta> _perguntas = [
    Pergunta(
      pergunta: 'Quando Bloodborne foi lancado?',
      respostas: ['2014', '2015', '2016', '2013'],
      respostaCorreta: '2015',
      imagePath: 'assets/images/p1.png',
    ),
    Pergunta(
      pergunta: 'Qual o nome desse Boss?',
      respostas: ['Besta Clerical', 'Paarl Fera Negra', 'Vicar Amelia', 'Fera sedenta de sangue'],
      respostaCorreta: 'Paarl Fera Negra',
      imagePath: 'assets/images/p2.jpg',
    ),
    Pergunta(
      pergunta: 'Qual eh o maximo padrao de cura?',
      respostas: ['15', '25', '20', '21'],
      respostaCorreta: '20',
      imagePath: 'assets/images/p3.jpg',
    ),
     Pergunta(
      pergunta: 'Onde acontece a batalha com a Lady Maria?',
      respostas: ['Torre do relogio', 'Catedral', 'vila invisivel', 'antiga Yharnam'],
      respostaCorreta: 'Torre do relogio',
      imagePath: 'assets/images/p4.jpg',
    ),
     Pergunta(
      pergunta: 'Bloodborne pertence a qual empresa?',
      respostas: ['Rockstar', 'Ubisoft', 'Santa Monica', 'FromSoftware'],
      respostaCorreta: 'FromSoftware',
       imagePath: 'assets/images/p5.jpg',
    ),
     Pergunta(
      pergunta: 'Qual desses lugares não faz parte do universo do jogo Bloodborne?',
      respostas: ['Central Yharnam', 'Bed of Chaos', 'Hunters Dream', 'Yharnam'],
      respostaCorreta: 'Bed of Chaos',
       imagePath: 'assets/images/p6.jpg',
    ),
    Pergunta(
      pergunta: 'Qual é o chefe final do jogo?',
      respostas: ['Bruxa de hemwick', 'Gherman, o primeiro caçador', 'Fera Clerical', 'Fera Sedenta de sangue'],
      respostaCorreta: 'Gherman, o primeiro caçador',
       imagePath: 'assets/images/p7.jpg',
    ),
    Pergunta(
      pergunta: 'Quem foi o primeiro caçador da Igreja da Cura?',
      respostas: ['Eileen, o Corvo', 'Ludwig, o Espada de prata', 'Brador, o Assassino da igreja', 'Padre Gascoigne'],
      respostaCorreta: 'Ludwig, o Espada de prata',
       imagePath: 'assets/images/p8.jpg',
    ),
    Pergunta(
      pergunta: 'Para onde os caçadores vao apos sofrer o Flagelo da Fera?',
      respostas: ['Pesadelo de Mensis', 'Sonho do caçador', 'Pesadelo do Caçador', 'Aldeia dos pescadores'],
      respostaCorreta: 'Pesadelo do Caçador',
       imagePath: 'assets/images/p9.jpg',
    ),
    Pergunta(
      pergunta: 'Qual desses bosses nao faz parte do jogo?',
      respostas: ['Fera Sedenta de sangue', 'Padre Gascoigne', 'Martyr Logarius', 'Gaping Dragon'],
      respostaCorreta: 'Gaping Dragon',
       imagePath: 'assets/images/p10.jpg'
    ),
  ];



  void _responderPergunta(String resposta) {
    if (_perguntas[_perguntaAtual].respostaCorreta == resposta) {
      setState(() {
        _pontuacao++;
      });
    }

    if (_perguntaAtual < _perguntas.length - 1) {
      setState(() {
        _perguntaAtual++;
      });
    }else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Telaresultado(_pontuacao, _perguntas.length, resetQuiz)),
      );
    }
  }

  void resetQuiz() {
    setState(() {
      _perguntaAtual = 0;
      _pontuacao = 0;
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
      title: Text('Boa Sorte Caçador'),
      backgroundColor: Colors.grey[700],
    ),
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1A1A1A), Color(0xFF262626)],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _perguntas[_perguntaAtual].imagePath,
              width: 300, 
              height: 300, 
            ),
            SizedBox(height: 20),
            Text(
              'Pergunta ${_perguntaAtual + 1}/${_perguntas.length}',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              _perguntas[_perguntaAtual].pergunta,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _perguntas[_perguntaAtual].respostas.map((resposta) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                    ),
                    onPressed: () {
                      _responderPergunta(resposta);
                    },
                    child: Text(resposta, style: TextStyle(color: Colors.white)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    ),
  );
 }
}