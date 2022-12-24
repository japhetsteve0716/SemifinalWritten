class Note{
  final int? id;
  final String name;
  final String address;

  const Note({required this.name, required this.address, this.id});

  factory Note.fromJson(Map<String,dynamic>json) => Note(
      id: json['id'],
      name: json['name'],
      address: json['address']
  );

  Map<String,dynamic> toJson() => {
    'id':id,
    'name':name,
    'address':address,
  };
}