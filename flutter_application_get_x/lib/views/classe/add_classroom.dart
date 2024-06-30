import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_get_x/controllers/classroom_controller.dart';
import 'package:flutter_application_get_x/controllers/filiere_controller.dart';
import 'package:flutter_application_get_x/models/entity/classe.dart';
import 'package:flutter_application_get_x/models/entity/filiere.dart';
import 'package:flutter_application_get_x/models/services/filiere_service.dart';
import 'package:flutter_application_get_x/shared/widgets/rounded_input.dart';
import 'package:flutter_application_get_x/shared/widgets/side_drawer.dart';
import 'package:get/get.dart';
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class AddClassRoom extends StatelessWidget {

  AddClassRoom({super.key});
  final classRoomController = Get.find<ClassRoomController>();
  final filiereController = Get.find<FiliereController>();
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideDrawer(),
        appBar: AppBar(
          title: const Text("Classes"),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          elevation: 0.00,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              RoundedInput(
                hintText: "Niveau",
                controller: classRoomController.niveauClassRoomController,
              ),
              //selection
              const SizedBox(
                height: 20,
              ),
              DropdownMenu<String>(
                initialSelection: list.first,
                onSelected: (String? value) {
                  classRoomController.filiereClassRoomController.text = value!;
                },
                dropdownMenuEntries: filiereController.filieres.map<DropdownMenuEntry<String>>((Filiere value) {
                  return DropdownMenuEntry<String>(value: value.libelle, label: value.libelle);
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    classRoomController.classrooms.add(ClassRoom(
                        niveau: classRoomController.niveauClassRoomController.text,
                        filiere : classRoomController.filiereClassRoomController.text
                    ));
                    classRoomController.niveauClassRoomController.clear();
                    classRoomController.filiereClassRoomController.clear();
                    Get.snackbar(
                      'Added',
                      'Nouvelle Classe',
                      snackPosition: SnackPosition.TOP ,
                      forwardAnimationCurve: Curves.elasticInOut,
                      reverseAnimationCurve: Curves.easeOut,
                    );
                  },
                  child: const Text(
                    "Enregistrer",
                    style: TextStyle(fontSize: 18),
                  )),
              const SizedBox(
                height: 20,
              ),
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: classRoomController.classrooms.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${classRoomController.classrooms[index].niveau} ${classRoomController.classrooms[index].filiere}"  ,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      );
                    },
                  ))
            ],
          ),
        )));
  }
}
