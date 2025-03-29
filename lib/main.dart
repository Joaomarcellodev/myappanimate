import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const MyHomePage(title: 'Dicee'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int valorDado01 = 1;
  int valorDado02 = 1;

  // Sortear um inteiro e retornar o valor
  int proximoValor() {
    Random a = Random();
    int numeroSorteado = a.nextInt(6) + 1;
    return numeroSorteado;
  }

  void rolarDados() {
    setState(() {
      valorDado01 = proximoValor();
      valorDado02 = proximoValor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Center(
          child: Text(
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'arial',
              fontWeight: FontWeight.bold,
            ),
            widget.title,
          ),
        ),
      ),
      backgroundColor: Colors.red,
      body: Center(
       child: GestureDetector(
        onTap: rolarDados,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/dice$valorDado01.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(width: 20,),
            Image.asset(
              'assets/dice$valorDado02.png',
              width: 100,
              height: 100,
            )
          ],
        ),
       ),
      ),
    );
  }
}
