import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widget/custom_button.dart';
import 'package:note_app/views/widget/custom_text_filed.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            labelText: 'Title',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter content';
              }
              return null;
            },
            labelText: 'Content',
            maxLines: 4,
          ),
          const SizedBox(height: 100),
          BlocBuilder<AddNoteCubitCubit, AddNoteCubitState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteCubitLoading ? true : false,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();

                    var formatedCurrentDate =
                        DateFormat.yMEd().format(currentDate);
                    var noteModel = Note(
                        color: Colors.blue.value,
                        title: title!,
                        content: subTitle!,
                        date: formatedCurrentDate);
                    BlocProvider.of<AddNoteCubitCubit>(context)
                        .addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'Add',
              );
            },
          ),
        ],
      ),
    );
  }
}
