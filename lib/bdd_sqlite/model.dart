// ignore_for_file: non_constant_identifier_names

class Note {
  late final String id;
  late final String description;

  Note({required this.id, required this.description});

  Note.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        description = item["description"];

  Map<String, Object> toMap() {
    return {'id': id, 'description': description};
  }

  void set_id(String Id) {
    id = Id;
  }

  void set_desc(String desc) {
    description = desc;
  }
}
