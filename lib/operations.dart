// ignore_for_file: non_constant_identifier_names

class Etudiant {
  String Matricule = "";
  String Nom = "";
  int Age = 0;

  Etudiant(String Nom_Etudiant, String Matricule_Etudiant, int Age_Etudiant) {
    this.Matricule = Matricule_Etudiant;
    this.Nom = Nom_Etudiant;
  }

//Accesseur du matricule
  String getter_matricule() {
    return Matricule;
  }

  // Mutateur de matricule
  void setter_matricule(String Valeur_Matricule) {
    Matricule = Valeur_Matricule;
  }
}

class cp extends Etudiant {
  cp(super.Nom_Etudiant, super.Matricule_Etudiant, super.Age_Etudiant);
  String getter_matricule_cp() {
    return Matricule;
  }
}
