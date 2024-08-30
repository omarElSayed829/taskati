

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskati/core/Localization/widgets/Utils/appColor.dart';

TextStyle getHeadLineTextStyle({double fontSize=24,fontWeight=FontWeight.bold
, color=AppColor.darkColorBg


}){

  return TextStyle(

fontSize : fontSize,
color: color,
fontWeight: fontWeight,

  );
}

TextStyle getTitleTextStyle({double fontSize=18,fontWeight=FontWeight.bold
, color= AppColor.darkColorBg


}){

  return TextStyle(

fontSize : fontSize,
color: color,
fontWeight: fontWeight,

  );
}




TextStyle getBodyTextStyle({double fontSize=16,fontWeight=FontWeight.normal
, color=AppColor.darkColorBg


}){

  return TextStyle(

fontSize : fontSize,
color: color,
fontWeight: fontWeight,

  );
}


TextStyle getSmallTextStyle({double fontSize=14,fontWeight=FontWeight.normal
, color=AppColor.greyColor


}){

  return TextStyle(

fontSize : fontSize,
color: color,
fontWeight:fontWeight,

  );
}
