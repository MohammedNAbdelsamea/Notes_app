import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.text,required this.color, this.onTap,  this.isLoading=false});
final String text;
final Color color;
final bool isLoading;

final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color:color,
        ),
        child: Center(
          child: isLoading?const SizedBox(
            height: 25,
            width: 25,
            child:  CircularProgressIndicator(
              color: CupertinoColors.black,

            ),
          ) :Text(
              text,
            style: TextStyle(
              color: CupertinoColors.black,
              fontSize:20,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
