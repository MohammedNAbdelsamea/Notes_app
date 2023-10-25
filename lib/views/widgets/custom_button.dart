import 'package:flutter/cupertino.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.text,required this.color});
final String text;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color:color,
      ),
      child: Center(
        child: Text(
            text,
          style: TextStyle(
            color: CupertinoColors.black,
            fontSize:20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
