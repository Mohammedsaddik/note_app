import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:note_app/views/note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.notes});
  static String id = 'CustomNoteItem';
  final Note notes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditNoteView.id);
      },
      child: Card(
          color: Color(notes.color),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  notes.title,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(notes.content,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                    )),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    size: 30.0,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    notes.delete();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10),
                child: Text(
                  notes.date,
                  style: TextStyle(color: Colors.black.withOpacity(0.4)),
                ),
              ),
            ],
          )),
    );
  }
}
