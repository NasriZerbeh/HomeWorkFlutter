import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormularioIUJO extends StatelessWidget {
  bool checkTrabajo = false;
  bool checkEstudio = false;
  bool switchNotify = false;
  String sexo = "";
  String textnotify = "";
  String? edocivil = "Seleccione...";
  double priceStimated = 0;

  FormularioIUJO({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(244, 67, 54, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'IUJO',
                      style: TextStyle(color: Colors.red, fontSize: 80),
                    ),
                    Text(
                      'Extensión Barquisimeto',
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                Text(
                  '♥',
                  style: TextStyle(color: Colors.red, fontSize: 120),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Formulario Captura de Datos',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  prefixIcon: Icon(
                    Icons.edit,
                    color: Color.fromRGBO(244, 67, 54, 1),
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Ingrese su nombre',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: 250,
              height: 40,
              child: Text(
                'Ocupación',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    value: checkTrabajo,
                    onChanged: (bool? value) {
                      setState(() {
                        checkTrabajo = value!;
                      });
                    },
                  ),
                  const Text('Trabaja'),
                ],
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: Row(
                children: <Widget>[
                  Checkbox(
                      value: checkEstudio,
                      onChanged: (bool? value) {
                        setState(() {
                          checkEstudio = value!;
                        });
                      }),
                  const Text('Estudia'),
                ],
              ),
            ),
            const SizedBox(
              width: 250,
              height: 40,
              child: Text(
                'Seleccione su sexo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: Row(
                children: <Widget>[
                  Radio(
                    value: 'Femenino',
                    groupValue: sexo,
                    onChanged: (String? value) {
                      setState(() {
                        sexo = value!;
                      });
                    },
                  ),
                  const Text('Femenino'),
                ],
              ),
            ),
            SizedBox(
              width: 250,
              child: Row(
                children: <Widget>[
                  Radio(
                    value: 'Masculino',
                    groupValue: sexo,
                    onChanged: (String? value) {
                      setState(() {
                        sexo = value!;
                      });
                    },
                  ),
                  const Text('Masculino'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: Row(
                children: <Widget>[
                  Switch(
                    value: switchNotify,
                    activeColor: Colors.red,
                    onChanged: (bool? value) {
                      setState(() {
                        switchNotify = value!;
                      });
                    },
                    inactiveThumbColor: Colors.red,
                    inactiveTrackColor: Colors.white,
                  ),
                  const Text('Activar Notificaciones'),
                ],
              ),
            ),
            SizedBox(
                child: Column(
              children: <Widget>[
                Text(textnotify),
              ],
            )),
            const SizedBox(
              height: 20,
            ),
            const Text('Seleccione Precio estimado'),
            SizedBox(
              width: 350,
              child: Slider(
                thumbColor: Colors.red,
                value: priceStimated,
                max: 100,
                divisions: 100,
                label: priceStimated.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    priceStimated = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 100),
                  lastDate: DateTime(DateTime.now().year + 100),
                ).then((value) => null);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Seleccionar Fecha'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Seleccionar Hora'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: DropdownButton<String>(
                onChanged: (String? newValue) {
                  edocivil = newValue;
                },
                items: listaCivil.map<DropdownMenuItem<String>>((String value) {
                  {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }
                }).toList(),
                icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                iconDisabledColor: Colors.red,
                iconSize: 30,
                isExpanded: true,
                hint: Text(edocivil!),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    Text(
                      ' Enviar',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: ,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.*/
    );
  }
  
  void setState(Null Function() param0) {}
}

List<String> listaCivil = <String>['Soltero', 'Casado', 'Divorciado', 'Vuido'];
