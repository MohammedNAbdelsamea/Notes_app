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



  }
}