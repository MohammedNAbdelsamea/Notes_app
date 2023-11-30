
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_th/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_th/models/note_model.dart';

import 'package:notes_th/views/widgets/custom_text_field.dart';


import '../cubits/notes_cubit/notes_state.dart';
import 'widgets/custom_notes_item.dart';



class SearchNoteView extends StatefulWidget {
  const SearchNoteView({super.key});

  @override
  State<SearchNoteView> createState() => _SearchNoteViewState();
}

class _SearchNoteViewState extends State<SearchNoteView> {

bool isSearching=false;
final searchingController=TextEditingController();




  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40,left: 8,right: 8),
            child: CustomTextField(

              controller: searchingController,
              hint: 'Search a Note',
              onChanged: (value) {
                if (value!.isEmpty) {
                  // If search query is empty, reset search and fetch all notes
                  setState(() {
                    isSearching = false;
                    searchingController.clear();
                  });
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                } else {
                  // If search query is not empty, perform the search
                  BlocProvider.of<NotesCubit>(context).searchNotes(value);
                  setState(() {
                    isSearching = true;
                  });
                }
              },

            ),

          ),
         const SizedBox(
            height: 10,
          ),
          Expanded(

            child: BlocBuilder<NotesCubit, NotesState>(
              builder: (context, state) {
                if (state is NotesLoading) {
                  return const CircularProgressIndicator();

                } else if (state is NotesSuccess) {
                  List<NoteModel>notes=BlocProvider.of<NotesCubit>(context).notes??[];
                  if (notes.isEmpty) {
                    return const Center(
                      child: Text('No notes found.',
                        style: TextStyle(
                          fontSize: 18, // Adjust the font size as needed
                          // You can also set other text style properties here if needed
                        ),

                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ListView.builder(
                        itemCount:notes.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context,index){

                          return  Padding(
                            padding:const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                            child:  NotesItem(
                              note: notes[index],
                            ),
                          );
                        }
                    ),
                  );


                } else if (state is NotesError) {
                  return Text('Error: ${state.errMessage}');
                } else {
                  return const Text('Unknown state');
                }
              },
            ),
          ),


        ],
      ),
    );
  }
}
