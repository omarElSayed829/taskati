import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/Localization/widgets/Utils/appColor.dart';
import 'package:taskati/core/Localization/widgets/Utils/services/local_storage.dart';
import 'package:taskati/core/Localization/widgets/Utils/textStyle.dart';
import 'package:taskati/core/Localization/widgets/models/task_model.dart';
import 'package:taskati/feature/upload/upload_view.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox("userBox");
  Hive.registerAdapter(taskModelAdapter());
  await Hive.openBox<taskModel>("taskBox");
  AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
     statusBarColor: AppColor.primaryColor,
     statusBarBrightness: Brightness.light
     
    ));
    return  MaterialApp(
      
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        fontFamily: "Poppins",
        appBarTheme: AppBarTheme(
          centerTitle: true,
          
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: getSmallTextStyle(),
          enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.primaryColor)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.greyColor)
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.redColor),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.redColor)
                  )
        )
      ),
      home:const uploadView()
    );
  }
}
