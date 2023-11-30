import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_th/constants.dart';

import 'package:notes_th/models/note_model.dart';

import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState>{
  NotesCubit():super(NotesInitial());
  List<NoteModel> ?notes;
  fetchAllNotes()async{


      var notesBox=Hive.box<NoteModel>(kNotesBox);

      notes=notesBox.values.toList();

emit(NotesSuccess());

  } // New method for filtering notes based on a search query
   searchNotes(String searchQuery) {
    try {
      emit(NotesLoading());

      // Filter notes based on the search query
      notes = notes!
          .where((note) =>
      note.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
          note.subTitle.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();

      emit(NotesSuccess());
    } catch (e) {
      emit(NotesError(e.toString()));
    }
  }
}