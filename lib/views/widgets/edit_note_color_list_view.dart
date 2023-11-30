
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/note_model.dart';
import 'colors_list_view.dart';


class EditNoteColorsListView extends StatefulWidget {
  const EditNoteColorsListView({super.key, required this.note});
final NoteModel note;
  @override
  State<EditNoteColorsListView> createState() => _EditNoteColorsListView();
}

class _EditNoteColorsListView extends State<EditNoteColorsListView> {
  late int curIdx;
  @override
  void initState(){
    curIdx=kColors.indexOf(Color(widget.note.color));
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38*2,
      child: ListView.builder(
          itemCount: kColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return  Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 6),
              child:  GestureDetector(
                onTap: (){
                  curIdx=index;
                  widget.note.color=kColors[index].value;
                  setState(() {

                  });
                },
                child: ColorItem(
                  color: kColors[index],
                  isActive: curIdx==index,
                ),
              ),
            );
          }
      ),
    );
  }
}
