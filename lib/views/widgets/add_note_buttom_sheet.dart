import 'package:flutter/cupertino.dart';
import 'package:notes_th/views/widgets/custom_text_field.dart';

class AddButtonSheet extends StatelessWidget {
  const AddButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
        ],
      ),
    );
  }
}
