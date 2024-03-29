class ContactModal {
  int number, id;
  String name;

  ContactModal({required this.number, required this.name, required this.id});

  factory ContactModal.fromMap({required Map data}) =>
      ContactModal(name: data['name'], number: data['number'], id: data['id']);

  Map<String, dynamic> get toMap => {
        'name': name,
        'number': number,
        'id': id,
      };
}
