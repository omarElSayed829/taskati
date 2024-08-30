import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/Localization/widgets/Utils/appColor.dart';
import 'package:taskati/core/Localization/widgets/Utils/services/functions/dialogs.dart';
import 'package:taskati/core/Localization/widgets/Utils/services/functions/navigation.dart';
import 'package:taskati/core/Localization/widgets/Utils/services/local_storage.dart';
import 'package:taskati/core/Localization/widgets/Utils/textStyle.dart';
import 'package:taskati/core/Localization/widgets/custom_button.dart';
import 'package:taskati/feature/home/home_view.dart';

class uploadView extends StatefulWidget {
  const uploadView({super.key});

  @override
  State<uploadView> createState() => _uploadViewState();
}

class _uploadViewState extends State<uploadView> {

  String? imagePath;
String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){

            if(imagePath!=null && name.isNotEmpty){
             AppLocalStorage.cahceData(AppLocalStorage.kUserImage,imagePath);
             AppLocalStorage.cahceData(AppLocalStorage.kUserName,name);
             AppLocalStorage.cahceData(AppLocalStorage.kIsUploaded,true);
              pushReplacement(context, homeView());

            } else if(imagePath !=null && name.isEmpty){
              showErrorDialogs(context, "Name canno't be empty");

            } else if(imagePath==null && name.isNotEmpty){
              showErrorDialogs(context, "Image canno't be empty");

            } else {
              showErrorDialogs(context, "Image and name canno't be empty");
            }


          },
           child: 
           Text("Done",style: getBodyTextStyle(color: AppColor.primaryColor),))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               CircleAvatar(
                  radius: 80,
                  backgroundImage:(imagePath != null)?
                  FileImage(File(imagePath??"")) as ImageProvider 
                  : const AssetImage("assets/Images/profile.jpg"),
                  
                  
                ),
            
            Gap(10),
               
               customButtonWidget(text: "Upload from Camera", 
               onTap:(){
                pickImage(isFromCamera: true);
               }),
            
                Gap(10),
            
              customButtonWidget(text: "Upload from Gallery", 
               onTap: (){
                pickImage(isFromCamera: false);
               }),
            
               Gap(10),
            
               Divider(),
            
            Gap(10),
               TextFormField(
                onChanged: (value) {
                  name =value;
                },
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                  
            
                  
                ),
               )
            
            
              ],
            ),
          ),
        ),
      ),
    );

    
  }
pickImage({required bool  isFromCamera}){

ImagePicker().pickImage
             (source:isFromCamera? ImageSource.camera : ImageSource.gallery).then((value) {
                  if(value != null){
                  setState(() {
                    imagePath = value.path;
                  });}
                });

}

  
}

