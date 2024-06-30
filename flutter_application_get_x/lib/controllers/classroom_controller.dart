// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_get_x/models/services/classeroom_service.dart';
import 'package:get/get.dart';

import '../models/entity/classe.dart';

class ClassRoomController extends GetxController {
    ClassRoomService  classRoomService;
    final classrooms= <ClassRoom>[
        ClassRoom( niveau: "Master!", filiere: "CDSD"),
        ClassRoom(niveau: "Master2", filiere: "GLRS")
    ].obs;

    final niveauClassRoomController=TextEditingController();
    final filiereClassRoomController=TextEditingController();

    ClassRoomController({
      required this.classRoomService,
    });
    
   @override
  void onInit() {
    // TODO: implement onInit
      super.onInit();
      var list=  classRoomService.findAll();
      if(list!=null) classrooms.assignAll(list);
      ever(classrooms, (_) => classRoomService.save(classrooms.value));
  }

  

  
  
}
