// ignore_for_file: unrelated_type_equality_checks

import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController vAlturaController = TextEditingController();
  TextEditingController vPesoController = TextEditingController();

  String _resultado = "Calcular";
  String _uriImage = "img/default.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IMC - PESO "),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: 350,
              height: 350,
              child: Image(
                image: AssetImage(_uriImage),
              ),
            ),
            Text(
              _resultado,
              style: const TextStyle(color: Colors.blueAccent, fontSize: 20),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: vAlturaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Digite sua Altura",
                      style: TextStyle(color: Color.fromARGB(255, 4, 6, 156))),
                  prefix: Text("m "),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: vPesoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Digite seu Peso",
                      style: TextStyle(color: Color.fromARGB(255, 4, 6, 156))),
                  prefix: Text("kg "),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 19, 68, 133),
                ),
                child: const Expanded(
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      color: Color.fromARGB(255, 230, 230, 230),
                    ),
                  ),
                ),
                onPressed: () {
                  double vAltura =
                      double.parse(vAlturaController.text.replaceAll(",", "."));
                  double vPeso =
                      double.parse(vPesoController.text.replaceAll(",", "."));

                  if (vAltura == "" || vPeso == "") {
                    return;
                  }

                  double result = vPeso / (vAltura * vAltura);
                  setState(() {
                    if (result < 18.6) {
                      _uriImage = "img/abaixopeso.png";
                      _resultado = "Abaixo do Peso";
                    } else if (result > 18.5 && result < 25.0) {
                      _uriImage = "img/pesoideal.png";
                      _resultado = "Peso Ideal";
                    } else if (result > 24.9 && result < 30.0) {
                      _uriImage = "img/levementeacimadopeso.png";
                      _resultado = "Levemente Acima do Peso";
                    } else if (result > 29.9 && result < 35.0) {
                      _uriImage = "img/obesidadegrauum.png";
                      _resultado = "Obesidade Grau 1";
                    } else if (result > 34.9 && result < 40.0) {
                      _uriImage = "img/obesidadegraudois.png";
                      _resultado = "Obesidade Grau 2";
                    } else if (result > 39.9) {
                      _uriImage = "img/obesidade.png";
                      _resultado = "Obesidade Grau 3";
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
