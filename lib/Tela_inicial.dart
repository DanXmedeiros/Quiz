import 'package:flutter/material.dart';
import 'Quiz.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/inicio.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Vamos la caçador?',
                style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 255, 255, 255)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaQuiz()),
                  );
                },
                child: Text(
                  'começar a caçada',
                  style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 82, 82, 82)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
