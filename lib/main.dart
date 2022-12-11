// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_exercise_1/forms/calculage.dart';
import 'package:flutter_exercise_1/forms/login.dart';
import 'package:flutter_exercise_1/operations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        'calculPage': (context) => form_calculage(),
        'loginPage': (context) => login(Nom: "ODILASTE"),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum SingingCharacter { Client, Employe }

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  TextEditingController ctr_Names = TextEditingController();
  TextEditingController ctr_password = TextEditingController();

  String gender = "";
  String civil_State = "";
  bool worker = false;
  bool licenciate = true;

  cp cp_L2_GI = cp("KATEMBO", "0002", 26);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.ltr,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            // ignore: prefer_const_constructors
            TextField(
              controller: ctr_Names,
              textDirection: TextDirection.rtl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Vos Noms'),
            ),
            TextFormField(
              controller: ctr_password,
              textDirection: TextDirection.rtl,
              keyboardType: TextInputType.number,
              obscureText: true,
              obscuringCharacter: "#",
              decoration: InputDecoration(hintText: 'Votre Mot de passe'),
            ),
            Text("Genre"),
            SizedBox(height: 25),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                    title: const Text('Masculin'),
                    leading: Radio(
                      groupValue: gender,
                      value: 'M',
                      activeColor: Colors.red,
                      onChanged: (valeur_genre) {
                        setState(() {
                          gender = valeur_genre.toString();
                        });
                      },
                    )),
                ListTile(
                    title: const Text('Feminin'),
                    leading: Radio(
                      groupValue: gender,
                      value: 'F',
                      activeColor: Colors.red,
                      onChanged: (valeur_genre) {
                        setState(() {
                          gender = valeur_genre.toString();
                        });
                      },
                    )),
                Text("Etat Civil"),
                ListTile(
                    title: const Text('Célibataire'),
                    leading: Radio(
                      groupValue: civil_State,
                      value: 'Célibataire',
                      activeColor: Colors.red,
                      onChanged: (valeur_genre) {
                        setState(() {
                          civil_State = valeur_genre.toString();
                        });
                      },
                    )),
                ListTile(
                    title: const Text('Marié'),
                    leading: Radio(
                      groupValue: civil_State,
                      value: 'Marié',
                      activeColor: Colors.red,
                      onChanged: (valeur_genre) {
                        setState(() {
                          civil_State = valeur_genre.toString();
                        });
                      },
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Employé ?"),
                Checkbox(
                    value: worker,
                    onChanged: (bool? valeur_coche) => setState(() {
                          worker = valeur_coche!;
                        })),
                SizedBox(width: 100),
                Text("Licencié"),
                Checkbox(
                    value: licenciate,
                    onChanged: ((value_licenciate) => setState(() {
                          licenciate = value_licenciate!;
                        })))
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(shadowColor: Colors.black),
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Vous voulez vraiment enregistrer ?'),
                    content: Text('Noms: ' +
                        ctr_Names.text +
                        ' ,Genre: ' +
                        gender +
                        ', Employé ' +
                        worker.toString() +
                        ', Licencié: ' +
                        licenciate.toString()),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, ''),
                        child: const Text('Annuler'),
                      ),
                      TextButton(
                        onPressed: () =>
                            print("Vous avez cliqué sur le bouton Confimer"),
                        child: const Text('Confirmer'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Envoyer '),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: (() {
                  print(cp_L2_GI.Matricule);
                }),
                child: Text("Manipulation des classes"))
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
