import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/Localization/widgets/Utils/appColor.dart';
import 'package:taskati/core/Localization/widgets/Utils/services/functions/navigation.dart';
import 'package:taskati/core/Localization/widgets/Utils/services/local_storage.dart';
import 'package:taskati/core/Localization/widgets/Utils/textStyle.dart';
import 'package:taskati/core/Localization/widgets/custom_button.dart';
import 'package:taskati/core/Localization/widgets/models/task_model.dart';

import 'package:taskati/feature/home/home_view.dart';
class addTaskView extends StatefulWidget {
  const addTaskView({super.key});

  @override
  State<addTaskView> createState() => _addTaskViewState();
}

class _addTaskViewState extends State<addTaskView> {

  int colorIndex = 0;
  dynamic date = DateFormat.yMd().format(DateTime.now());
String startTime = DateFormat("hh:mm a").format(DateTime.now());
String endTime = DateFormat("hh:mm a").format(DateTime.now());

var textController = TextEditingController();
var noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title",style: getBodyTextStyle(),),
              Gap(10),
              TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Ex: Flutter Task"
                ),
              ),
          Gap(10),
              Text("Note"),
              TextFormField(
                controller: noteController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Type Your note"
                ),
              ),
            Gap(10),
              Text("Date"),
              TextFormField(
                onTap: () {
                  showDatePicker(context: context,
                   firstDate:DateTime.now(),
                   initialDate: DateTime.now(), 
                   lastDate: DateTime(2040)).then((value) => 
                   setState(() {
                    if(value != null){
                     date = DateFormat.yMd().format(value);
                    }
                   }),
                   );
                },
                readOnly: true,
                decoration: InputDecoration(
                hintText: date,
                hintStyle: getBodyTextStyle(),
                  suffixIcon: Icon(Icons.calendar_month_outlined,
                  color:AppColor.primaryColor ,)
                ),
              ),
          
              Gap(15),
          
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Start Time"),
                        Gap(5),
                        TextFormField(
                          onTap: () {
                            showTimePicker(context: context, 
                            initialTime:TimeOfDay.now() )
                            .then((value) {
                              if(value!=null){
                                setState(() {
                                  startTime = value.format(context);
                                });
                              }
                            });
                          },
                          decoration: InputDecoration(
                            hintText: startTime,
                            hintStyle: getBodyTextStyle(),
                            suffixIcon: Icon(Icons.timer,
                            color:AppColor.primaryColor ,)
                          ),
                        ),
                       
                      ],
                    ),
                  ),
          
                  Gap(15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("End Time"),
                        Gap(5),
                        TextFormField(
                          onTap: () {
                            showTimePicker(context: context, 
                            initialTime: 
                            TimeOfDay.now()).then((value){
                              if(value!=null){
                                setState(() {
                                  endTime = value.format(context);
                                });
                              }
                            });
                          },
                          decoration: InputDecoration(
                            hintText: endTime,
                            hintStyle: getBodyTextStyle(),
                            suffixIcon: Icon(Icons.timer,
                            color:AppColor.primaryColor ,)
                          ),
                        ),
                        
                      ],
                    ),
                    
                  ),
                  
                ],
                
              ),
          
              Gap(20),
            
              Row(
                children: [
          
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 150,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder:(context,index){
                              
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  colorIndex =index;
                                });
                              },
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor:(index==0)?
                                AppColor.primaryColor :
                                (index==1)?AppColor.orangeColor :
                                AppColor.redColor,
                              
                                child:(colorIndex==index)? Icon(Icons.check,
                                color:AppColor.whiteColor ):null
                                
                                
                              ),
                            );
                          } , 
                          separatorBuilder: (context,index){
                            return Gap(5);
                          },
                           itemCount:3),
                        )
                      ],
                    ),
                  ),
          
                  customButtonWidget(
                    width: 145,
                    text: "Create Task", 
                  onTap: (){
                    String id = "${Title}-${DateTime.now()}";
                    AppLocalStorage.cachedDataTask(id, taskModel(id: id, 
                    title: textController.text,
                     note:noteController.text,
                      date: date, 
                      startTime: startTime, 
                      endTime: endTime, 
                      color: colorIndex, 
                      isCompleted: false));

              pushAndRemoveUntill(context, homeView());
                  })
                ],
              )
              
            ],
          ),
        ),
      ),
    );
  }
}