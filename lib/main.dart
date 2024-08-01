import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _gas = TextEditingController();
  final TextEditingController _alc = TextEditingController();
  String exibirResult = ' ';

  // O método dispose é chamado quando o objeto State é removido permanentemente da árvore de widgets.
  @override
  void dispose() {
    _gas.dispose();
    _alc.dispose();
    super.dispose();
  }

  void Calcular() {
    if (_alc.text.isNotEmpty && _gas.text.isNotEmpty) {
      double alcool = double.tryParse(_alc.text) ?? 0.0;
      double gasolina = double.tryParse(_gas.text) ?? 0.0;
      if (gasolina != 0) {
        double resultado = alcool / gasolina;
        if (resultado <= 0.7) {
          setState(() {
            // exibirResult = resultado.toStringAsFixed(0);
            exibirResult = 'É melhor abastecer com álcool';
          });
          print('Método executado $resultado');
        } else {
          setState(() {
            exibirResult = 'É melhor abastecer com gasolina';
          });
        }
      } else {
        setState(() {
          exibirResult = 'Preço da gasolina não pode ser zero';
        });
      }
    } else {
      setState(() {
        exibirResult = 'Preencha ambos os campos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 84, 245, 124),
            title: const Center(
              child: Text(
                'Álcool x Gasolina',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          body: Stack(
            fit: StackFit.expand, // expande o elemento sobre toda a tela
            children: [
              Container(
                height: 100,
                child: Image.asset(
                  'img/back.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
              
                  Row(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 390,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 18),
                              child: TextField(
                                
                                controller: _alc,                              
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Preço do Álcool',
                                  labelStyle: TextStyle(
                                        color: Colors.green,),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 390,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _gas,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Preço da gasolina',
                                labelStyle: TextStyle(
                                      color: Colors.green,),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Btn1(onPressed: Calcular),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: 370,
                          color: Color.fromARGB(118, 121, 117, 117),
                          child: Center(
                            child: Text(exibirResult, style: TextStyle(color: Colors.white, fontSize: 20),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class Btn1 extends StatelessWidget {
  final VoidCallback onPressed;

  const Btn1({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 18),
        child: FilledButton.tonal(
          onPressed: onPressed,
          child: const Text('Calcular', style: TextStyle(fontSize: 20),),
          style: FilledButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 33, 243, 86), // Defina a cor de fundo desejada
            foregroundColor: Colors.white, // Defina a cor do texto e ícones
            
          
           ),
      ),
    ),
    );
  }
}
