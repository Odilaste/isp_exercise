import 'package:flutter/material.dart';

class form_calculage extends StatefulWidget {
  const form_calculage({super.key});

  @override
  State<form_calculage> createState() => _form_calculage();
}

class _form_calculage extends State<form_calculage> {
  double calculage(double currentYear, double birthYear) {
    double year = 0;
    year = currentYear - birthYear;
    return year;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCUL AGE"),
      ),
      body: Column(
        children: [
          Text('La valeur venue de Home est '),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Retour à la page accueil"))
        ],
      ),
    );
  }
}
