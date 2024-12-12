import 'package:flutter/material.dart';
import 'package:routenavigation/formulario.dart';
import 'calculator.dart';
import 'exitalert.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 56, 0, 66),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/LogoProjects.jpg'),
              )),
          child: Text(
            '...::: Proyecto Kuevanzi :::...',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.input),
          title: const Text('Bienvenido'),
          onTap: () => {},
        ),
        ListTile(
          leading: const Icon(Icons.calculate_outlined),
          title: const Text('Calculadora'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Calculadora()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.insert_drive_file_rounded),
          title: const Text('Formulario'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FormularioIUJO()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Salir'),
          onTap: () => {
            DialogoSalir.alert(context,
                title: 'Salir',
                description: '¿Seguro deseas salir?',
                icono: const Icon(Icons.exit_to_app))
          },
        ),
      ],
    ));
  }
}
