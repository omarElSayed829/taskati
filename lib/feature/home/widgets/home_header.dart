import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taskati/core/Localization/widgets/Utils/appColor.dart';
import 'package:taskati/core/Localization/widgets/Utils/services/local_storage.dart';
import 'package:taskati/core/Localization/widgets/Utils/textStyle.dart';

class homeHeaderWidget extends StatelessWidget {
  const homeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return Row(
      
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello ${AppLocalStorage.getCachedData(AppLocalStorage.kUserName)}",style:
             getTitleTextStyle(color:AppColor.primaryColor ),),
    
            Text("Have a Nice Day",
            style: getBodyTextStyle(),)
          ],  
        
        ),
        Spacer(),
    
      CircleAvatar(
        radius: 32,
        backgroundColor: AppColor.primaryColor,
        child: CircleAvatar(
          radius: 30,
          backgroundImage:AppLocalStorage.getCachedData(AppLocalStorage.kUserImage) !=null ?
           FileImage(File(AppLocalStorage.getCachedData(AppLocalStorage.kUserImage))) as ImageProvider: 
          const AssetImage("assets/Images/profile.jpg")
        ),
      )  ,
      
      ],

      
      
    );
    
  }
}