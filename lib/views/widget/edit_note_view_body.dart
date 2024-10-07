import 'package:flutter/material.dart';
import 'package:note_app/views/widget/custom_appBar.dart';
import 'package:note_app/views/widget/custom_text_filed.dart';

class EditNoteViewBody extends StatelessWidget {
  EditNoteViewBody({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(
            height: 40.0,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.done,
          ),
          SizedBox(
            height: 40.0,
          ),
          CustomTextField(
            labelText: 'Title',
          ),
          SizedBox(height: 20),
          CustomTextField(
            labelText: 'Content',
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
