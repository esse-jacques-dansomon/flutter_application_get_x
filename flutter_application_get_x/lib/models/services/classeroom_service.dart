import 'dart:convert';

import 'package:flutter_application_get_x/models/provider/provider.dart';
import 'package:flutter_application_get_x/shared/keys.dart';
import 'package:get/instance_manager.dart';

import '../entity/classe.dart';

class ClassRoomService {
    final  StorageData _storageData=Get.find<StorageData>();
    //store
      void save(List<ClassRoom> classes) {
         _storageData.write(keyClassrooms, jsonEncode(classes));
      }
    //show
    List<ClassRoom>?  findAll(){
       List<ClassRoom>  classes=[];
        var data=  jsonDecode( _storageData.read(keyClassrooms).toString());
       return data?.forEach((item)=>classes.add(ClassRoom.fromMap(item)));
          
    }
}