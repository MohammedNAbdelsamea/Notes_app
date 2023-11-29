import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
final bool isActive;
final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive?  CircleAvatar(
      radius: 38,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 34,
        backgroundColor: color,
      ),
    ):
     CircleAvatar(
      radius: 38,
      backgroundColor: color,
    )
    ;
  }
}
class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int curIdx=0;
  List<Color>colors=const[
   Color(0xff45062E),
   Color(0xff7F055F),
   Color(0xffE5A4CB),
   Color(0xffEBD2BE),
   Color(0xffFFE8D4),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38*2,
      child: ListView.builder(
        itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return  Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 6),
              child:  GestureDetector(
                onTap: (){
                  curIdx=index;
                  setState(() {

                  });
                },
                child: ColorItem(
                  color: colors[index],
                  isActive: curIdx==index,
                ),
              ),
            );
          }
      ),
    );
  }
}
