
import 'package:hive/hive.dart';
import 'package:taskati/core/Localization/widgets/models/task_model.dart';

class AppLocalStorage {

  static String kIsUploaded = "isUploaded";
  static String kUserName = "name";
  static String kUserImage = "image";

static late Box userBox; 
static late Box <taskModel> taskBox;

 static init(){
    userBox = Hive.box("userBox");
    taskBox = Hive.box("taskBox");
  }

static cahceData(String key,value){
  userBox.put(key, value);
}


static getCachedData(String key){
  return userBox.get(key);
}

static cachedDataTask(String key,taskModel value){
  taskBox.put(key, value); 
}

static taskModel? getCachedTaskData(String key){
 return taskBox.get(key);
}

}



// class AppLocalStorage {


// Static let Box <taskModel> taskBox 

// 

// method  init(){

// taskBox = Hive.box("taskBox")
//}


// cachedTask(key,<TaskModel>value){

// taskModel.put(key,<taskModel> value);

//}

//  }