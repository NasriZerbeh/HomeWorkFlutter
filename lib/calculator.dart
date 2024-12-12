import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class Calculadora extends StatelessWidget {
  Calculadora({super.key});

  final TextEditingController firstparameter = TextEditingController();
  final TextEditingController secondparameter = TextEditingController();
  final TextEditingController resultparameter = TextEditingController();
  String operacion = ' + ';
  int typeoperation = 0;
  double first = 0.0;
  double second = 0.0;
  double result = 0.0;

  void executeresult() {
    switch (typeoperation) {
      case 0:
        result = first + second;
        resultparameter.text = result.toStringAsFixed(2);
        break;
      case 1:
        result = first - second;
        resultparameter.text = result.toStringAsFixed(2);
        break;
      case 2:
        result = first * second;
        resultparameter.text = result.toStringAsFixed(2);
        break;
      case 3:
        if (second != 0) {
          result = first / second;
          resultparameter.text = result.toStringAsFixed(2);
        } else {
          resultparameter.text = "No se puede dividir entre 0";
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 61, 147),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/FondoCasio.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 500,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/LogoCasio.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 215,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: firstparameter,
                    decoration: InputDecoration(
                        hintText: 'Primer número:',
                        hintStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 1, 81, 201),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}')),
                    ],
                  ),
                ),
                Text(
                  operacion,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 215,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: secondparameter,
                    decoration: InputDecoration(
                      hintText: 'Segundo número:',
                      hintStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 1, 81, 201),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}')),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: TextField(
                readOnly: true,
                textAlign: TextAlign.center,
                controller: resultparameter,
                decoration: InputDecoration(
                  hintText: 'Resultado:',
                  hintStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 1, 81, 201),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    color: const Color.fromARGB(255, 1, 61, 147),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.blue, width: 2)),
                    onPressed: () {
                      setState(() {
                        operacion = ' + ';
                        typeoperation = 0;
                      });
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
                MaterialButton(
                    color: const Color.fromARGB(255, 1, 61, 147),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.blue, width: 2)),
                    onPressed: () {
                      setState(() {
                        operacion = ' - ';
                        typeoperation = 1;
                      });
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    color: const Color.fromARGB(255, 1, 61, 147),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.blue, width: 2)),
                    onPressed: () {
                      setState(() {
                        operacion = ' x ';
                        typeoperation = 2;
                      });
                    },
                    child: const Text(
                      'x',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
                MaterialButton(
                    color: const Color.fromARGB(255, 1, 61, 147),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.blue, width: 2)),
                    onPressed: () {
                      setState(() {
                        operacion = ' / ';
                        typeoperation = 3;
                      });
                    },
                    child: const Text(
                      '/',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            const SizedBox(height: 30),
            MaterialButton(
                color: const Color.fromARGB(255, 1, 61, 147),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.blue, width: 2)),
                onPressed: () {
                  first = double.parse(firstparameter.text);
                  second = double.parse(secondparameter.text);
                  executeresult();
                },
                child: const Text(
                  'Resultado',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 30),
            MaterialButton(
                color: const Color.fromARGB(255, 1, 61, 147),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.blue, width: 2)),
                onPressed: () {
                  firstparameter.text = '';
                  secondparameter.text = '';
                  resultparameter.text = '';
                },
                child: const Text(
                  'Limpiar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
            const Expanded(child: SizedBox()),
            const Text(
              'Derechos reservados para Casio Pirata',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
