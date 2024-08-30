
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/Localization/widgets/Utils/appColor.dart';
import 'package:taskati/core/Localization/widgets/Utils/services/functions/navigation.dart';
import 'package:taskati/core/Localization/widgets/Utils/textStyle.dart';
import 'package:taskati/core/Localization/widgets/custom_button.dart';
import 'package:taskati/feature/add_task/add_task_view.dart';

class TodayHeaderWidget extends StatelessWidget {
  const TodayHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return Row(
      
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat.yMMMEd().format(DateTime.now()),style:
             getTitleTextStyle(color:AppColor.primaryColor ),),
    
            Text("Today",
            style: getTitleTextStyle(),)
          ],  
        
        ),
        Spacer(),
    
    customButtonWidget(text:"Add Task" , onTap: (){

      push(context, addTaskView());
    },width: 130,)
      
      ],
      
    );
  }
}