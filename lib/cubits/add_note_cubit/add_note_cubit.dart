

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_th/constants.dart';
import 'package:notes_th/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_th/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {

  AddNoteCubit() :super(AddNoteInitial());
  Color? color=const Color(0xffd4a373);

  addNote(NoteModel note)async{

  note.color=color!.value;
    emit(AddNoteLoading());
    try{
      var notesBox=Hive.box<NoteModel>(kNotesBox);

      await notesBox.add(note);
      emit(AddNoteSuccess());
    }catch(e){
     emit(AddNoteFailure(e.toString()));
    }

  }
}