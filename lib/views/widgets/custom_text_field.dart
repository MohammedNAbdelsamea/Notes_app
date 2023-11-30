import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_th/constants.dart';

class CustomTextField extends StatelessWidget {
   const CustomTextField({super.key,required this.hint,this.maxLines=1, this.onSaved, this.onChanged,this.controller});
final String hint;
final int maxLines;
 final void Function (String?)?onSaved;
 final void Function (String?)?onChanged;

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      validator: (value){
        if(value?.isEmpty??true){
          return 'Field is required';
        }
        else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
hintText: hint,


        hintStyle: TextStyle(color: kPrimaryColor),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:  BorderSide(color:color?? Colors.white,),
      );
  }
}
