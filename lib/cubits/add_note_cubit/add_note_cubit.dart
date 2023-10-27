import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_th/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_th/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState>{
  AddNoteCubit():super(AddNoteInitial());
  addNote(NoteModel note){

  }
}