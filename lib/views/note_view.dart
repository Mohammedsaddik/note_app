import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/note_cubit/note_cubit.dart';
import 'package:note_app/views/widget/custom_add_note-bottom_sheet.dart';
import 'package:note_app/views/widget/custom_text_filed.dart';
import 'package:note_app/views/widget/notes_view_body.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});
  static String id = 'NoteView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: Scaffold(
        body: const NotesViewBody(),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(50.0), // Ensures the button is circular
          ),
          backgroundColor: Colors.green,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return AddNoteBottomSheet();
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
