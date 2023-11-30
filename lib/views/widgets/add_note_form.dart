

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_th/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_th/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_th/models/note_model.dart';
import 'package:notes_th/views/widgets/colors_list_view.dart';

import '../../constants.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState>formKey=GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  String? title,subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 32,),
          CustomTextField(
            onSaved: (value){
              title=value;
            },
            hint: 'Title',
          ),
          const SizedBox(height: 16,),
          CustomTextField(
            onSaved: (value){
              subTitle=value;
            },
            hint: 'Content',
            maxLines: 5,
          ),
          const SizedBox(height: 32,),
          ColorsListView(),
          const SizedBox(height: 32,),

          BlocBuilder <AddNoteCubit,AddNoteState>(

            builder: (context,state){
            return CustomButton(
                isLoading: state is AddNoteLoading?true:false,
                text: 'Add',
                onTap: (){
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    var currentDate=DateTime.now();
                    var formattedCurrentDate=
                        DateFormat.yMd().format(currentDate);
                        // DateFormat('dd-mm-yyyy').format(currentDate);
                    var noteModel=NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formattedCurrentDate
                        , color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  }else{
                    autovalidateMode=AutovalidateMode.always;
                    setState(() {

                    });
                  }

                },
                color: kPrimaryColor
            );
          },

          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}