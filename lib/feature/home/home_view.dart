import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/Localization/widgets/Utils/appColor.dart';
import 'package:taskati/core/Localization/widgets/Utils/services/local_storage.dart';
import 'package:taskati/feature/home/widgets/Task_Item.dart';
import 'package:taskati/feature/home/widgets/home_header.dart';
import 'package:taskati/feature/home/widgets/today_header.dart';

class homeView extends StatelessWidget {
  const homeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homeHeaderWidget() ,
                Gap(25),
                 TodayHeaderWidget(),
                 Gap(20),
            
                 DatePicker(
                  height: 100,
                  width: 80,
                    DateTime.now().subtract(Duration(days: 2)),
                    initialSelectedDate: DateTime.now(),
                    selectionColor:AppColor.primaryColor,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
            // New date selected
                     // setState(() {
             // _selectedValue = date;
                    //  });
                    },
                  ), 
            
                  Gap(20),
            
                  ValueListenableBuilder(
                    valueListenable: AppLocalStorage.taskBox.listenable(),
                    builder: (BuildContext context, dynamic value, Widget? child) {
                      return  ListView.separated(
                     shrinkWrap:true,
                      physics: NeverScrollableScrollPhysics(),
                       itemCount: 10,
                       separatorBuilder: (context, index) {
                         return Gap(10);
                          },
                       itemBuilder: (context,index){
                         return const TaskItemWidget();
                    });
                    },
                  ),
            
                 
              ],
            ),
          ),
        ),
      ),
    );
  }
}


