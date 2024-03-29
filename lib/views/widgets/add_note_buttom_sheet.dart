import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_th/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_th/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_th/cubits/notes_cubit/notes_cubit.dart';



import 'add_note_form.dart';

class AddButtonSheet extends StatelessWidget {
  const AddButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context)=>AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit,AddNoteState>(
        listener: (context,state){
if(state is AddNoteFailure){
  print('failed ${state.errMessage}');
}
if(state is AddNoteSuccess){
  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  Navigator.pop(context);
}
        },
          builder: (context,state){
            return AbsorbPointer(
             absorbing:state is AddNoteLoading?true:false,
              child:  Padding(
                padding:   EdgeInsets.only(left: 16,right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                    child: AddNoteForm()),
              ),
            );
          },

          ),
    );
  }
}


