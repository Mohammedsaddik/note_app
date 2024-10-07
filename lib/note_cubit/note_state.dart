part of 'note_cubit.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess extends NoteState {
  final List<Note> notes;

  NoteSuccess({required this.notes});
}

class NoteError extends NoteState {
  final String error;

  NoteError({required this.error});
}
