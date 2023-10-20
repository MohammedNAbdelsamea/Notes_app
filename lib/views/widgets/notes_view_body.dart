import 'package:flutter/cupertino.dart';
import 'package:notes_th/views/widgets/custom_notes_item.dart';

import 'custom_app_bar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomAppBar(),
          SizedBox(height: 20,),
          NotesItem(),
        ],
      ),
    );
  }
}
