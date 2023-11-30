import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_th/cubits/notes_cubit/notes_cubit.dart';

import 'package:notes_th/views/widgets/notes_list_view.dart';
import 'package:notes_th/views/search_note_view.dart';

import 'custom_app_bar.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState(){
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child:  Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(title: 'Note',

            icon: Icons.search,
            onPressed: (){
              Navigator.push
                (context,
                MaterialPageRoute(builder: (context){
                  return  SearchNoteView();
                }),
              );
            },

          ),
          // SizedBox(height: 20,),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
