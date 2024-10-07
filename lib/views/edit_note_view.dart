import 'package:flutter/material.dart';
import 'package:note_app/views/widget/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});
  static String id = 'EditNoteView';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditNoteViewBody(),
    );
  }
}
