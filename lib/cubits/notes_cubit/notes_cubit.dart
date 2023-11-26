import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_th/constants.dart';

import 'package:notes_th/models/note_model.dart';

import 'notes_state.dart';

class NotesCubit extends Cubit<NotesState>{
  NotesCubit():super(NotesInitial());
  fetchAllNotes()async{

    try{
      var notesBox=Hive.box<NoteModel>(kNotesBox);

      List<NoteModel>notes=notesBox.values.toList();
      emit(NotesSuccess(notes));
    }catch(e){
      emit(NotesFailure(e.toString()));
    }

  }
}