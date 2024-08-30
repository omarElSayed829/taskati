import 'package:flutter/material.dart';
import 'package:taskati/core/Localization/widgets/Utils/appColor.dart';
import 'package:taskati/core/Localization/widgets/Utils/textStyle.dart';

class customButtonWidget extends StatelessWidget {
  const customButtonWidget({
    super.key,
      this.width=250, 
     required this.text,
       this.height=50,
        this.color= AppColor.primaryColor, 
        this.textStyle, 
       required this.onTap,
         this.radius = 10,
  });

final double width ;
final String text;
final double height;
final Color color;
final TextStyle? textStyle;
final Function() onTap;
final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
         
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius)
          )
        ),
        onPressed: onTap,
         child:Text(text,style: 
         textStyle??getBodyTextStyle(color: AppColor.whiteColor)) ),
    );
  }
}