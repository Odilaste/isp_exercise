import 'package:flutter/material.dart';

class login extends StatelessWidget {
  final String Nom;
  const login({super.key, required this.Nom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PAGE LOGIN"),
      ),
      body: Column(
        children: [
          Text('La valeur venue de Home est :${this.Nom}'),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Rentrer à la page précédente"))
        ],
      ),
    );
  }
}
