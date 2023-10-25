import 'package:flutter/cupertino.dart';
import 'package:notes_th/constants.dart';
import 'package:notes_th/views/widgets/custom_button.dart';
import 'package:notes_th/views/widgets/custom_text_field.dart';

class AddButtonSheet extends StatelessWidget {
  const AddButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32,),
            CustomTextField(
              hint: 'Title',
            ),
            SizedBox(height: 16,),
            CustomTextField(
              hint: 'Content',
              maxLines: 5,
            ),
            SizedBox(height: 32,),
            CustomButton(text: 'Add', color: kPrimaryColor),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
