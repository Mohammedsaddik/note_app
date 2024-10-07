import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:note_app/const.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/simble_bloc_observer.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:note_app/views/note_view.dart';
import 'package:note_app/views/widget/custom_note_item.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>(KnotesBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NoteView.id,
      routes: {
        EditNoteView.id: (context) => const EditNoteView(),
        NoteView.id: (context) => const NoteView(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
