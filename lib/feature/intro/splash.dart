import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/Localization/widgets/Utils/services/functions/navigation.dart';
import 'package:taskati/core/Localization/widgets/Utils/services/local_storage.dart';
import 'package:taskati/core/Localization/widgets/Utils/textStyle.dart';
import 'package:taskati/feature/home/home_view.dart';
import 'package:taskati/feature/upload/upload_view.dart';

class splasView extends StatefulWidget {
  const splasView({super.key});

  @override
  State<splasView> createState() => _splasViewState();
}

class _splasViewState extends State<splasView> {


 @override
   void initState() {
     // TODO: implement initState
     super.initState();

 

     Future.delayed(Duration(seconds: 4) ,() {
       pushReplacement(context,AppLocalStorage.getCachedData(AppLocalStorage.kIsUploaded)??false ? 
       
       homeView():uploadView());
     });
   }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Taskati",style: getHeadLineTextStyle(
              fontWeight:FontWeight.w700),),

    Gap(15),

            Text("it's time to be oranized",style: 
            getSmallTextStyle(fontSize: 17),)
          ],
        ),
      ),
    );
  }
}