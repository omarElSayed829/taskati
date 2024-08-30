import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/Localization/widgets/Utils/appColor.dart';
import 'package:taskati/core/Localization/widgets/Utils/textStyle.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.primaryColor,
        
      ),
      child: Row(
        
        children: [
          Expanded(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Flutter Task -1",
                style:getBodyTextStyle(color: AppColor.whiteColor) ,),
                Gap(5),
    
                Row(
                  
                  children: [
                    Icon(Icons.alarm,color: AppColor.whiteColor,),
                    Gap(3),
                    Text("22:55 AM - 22:45 Am",
                    style:getBodyTextStyle(color: AppColor.whiteColor) ,),
                    
                    
                  ],
                  
                ),
                Gap(5),
                Text("I will Do This Task",
                style:getBodyTextStyle(color: AppColor.whiteColor) ,)
              ],
              
            ),
          ),
          Container(
            height: 50,
            width: 0.5,
            decoration: BoxDecoration(
              color: AppColor.whiteColor
            ),
          ),
          Gap(10),
          
          RotatedBox(
            quarterTurns: 3,
            child: Text("TODO",
            style: getBodyTextStyle(color: AppColor.whiteColor),),
          )
        ],
        
      ),
    );
  }
}
