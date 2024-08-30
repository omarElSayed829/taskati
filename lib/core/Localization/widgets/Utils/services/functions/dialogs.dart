


import 'package:flutter/material.dart';
import 'package:taskati/core/Localization/widgets/Utils/appColor.dart';

showErrorDialogs(BuildContext context,String text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: AppColor.redColor,
                content: Text(text)));
}