import 'package:sampledb/models/note_model.dart';
import 'package:sampledb/services/database_helper.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  final Note? note;
  const NoteScreen({
    Key? key,
    this.note
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final addressController = TextEditingController();

    if(note != null){
      nameController.text = note!.name;
      addressController.text = note!.address;
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text( note == null
            ? 'Details Form'
            : 'Edit Form'
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Center(
                child: Text(
                  'Add details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: TextFormField(
                controller: nameController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: 'e.g. Japhet Steven Ong',
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.tealAccent,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ))),
              ),
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                  hintText: 'e.g. Manolo Fortich, Bukidnon',
                  labelText: 'Address',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.tealAccent,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ))),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async {
                      final name = nameController.value.text;
                      final address = addressController.value.text;

                      if (name.isEmpty || address.isEmpty) {
                        return;
                      }

                      final Note model = Note(name: name, address: address, id: note?.id);
                      if(note == null){
                        await DatabaseHelper.addNote(model);
                      }else{
                        await DatabaseHelper.updateNote(model);
                      }

                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.tealAccent,
                                  width: 0.75,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                )))),
                    child: Text( note == null
                        ? 'Save' : 'Edit',
                      style: const TextStyle(fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}