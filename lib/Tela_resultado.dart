import 'package:flutter/material.dart';

class Telaresultado extends StatelessWidget {
  final int pontuacao;
  final int totalPerguntas;
  final Function resetQuiz;

  Telaresultado(this.pontuacao, this.totalPerguntas, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    double desempenho = (pontuacao / totalPerguntas) * 100;

    return Scaffold(
      appBar: AppBar(
        title: Text("Voce chegou ao final, caçador !"),
        backgroundColor: Colors.orange[100],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/final1.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Você completou o Quiz!',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 20),
              Text(
                'Pontuação: $pontuacao / $totalPerguntas',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Desempenho: ${desempenho.toStringAsFixed(2)}%',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  resetQuiz();
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Text('Recomeçar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFFFFF),  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}