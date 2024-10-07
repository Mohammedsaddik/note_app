import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/const.dart';
import 'package:note_app/models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  List<Note>? notes;
  void getNotes() {
    var noteBox = Hive.box<Note>(KnotesBox);
    notes = noteBox.values.toList();
  }
}
