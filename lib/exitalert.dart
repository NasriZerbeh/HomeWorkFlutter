import 'dart:io';
import 'package:flutter/material.dart';

abstract class DialogoSalir {
  static alert(
    BuildContext context, {
    required String title,
    required String description,
    required Icon icono,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: SizedBox(
            height: 120,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  children: [
                    const SizedBox(height: 20.0),
                    Image.asset(
                      'assets/Question.jpeg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 25.0),
                    Text(description),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          MaterialButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            minWidth: 100.0,
            height: 30.0,
            onPressed: () {
              exit(0);
            },
            color: Colors.blueGrey,
            child: const Text('Si', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 10.0),
          MaterialButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            minWidth: 100.0,
            height: 30.0,
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.blue,
            child: const Text('No', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
