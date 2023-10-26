import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:notes_th/views/widgets/notes_list_view.dart';

import 'custom_app_bar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child:  Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(title: 'Note',icon: Icons.search,),
          // SizedBox(height: 20,),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
