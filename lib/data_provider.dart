import 'package:flutter/material.dart';
import 'package:student_info/model.dart';

class DataProvider with ChangeNotifier{
   final List<StudentInfo> _infoList = [
   StudentInfo(id:49, name:'Ibrahim',designation:'Student'),
   StudentInfo(id:14, name:'Hasan',designation:'Student'),
   StudentInfo(id:15, name:'Rakib',designation:'Student'),
 ];

  List<StudentInfo> get infoList => _infoList;  


  void addData(int id, String name, String designation){
    _infoList.add(StudentInfo(id: id, name: name, designation: designation));
    notifyListeners();
  }

  
  void deleteData(StudentInfo name){
    _infoList.remove(name);
    notifyListeners();
  }

  void clearInfo(TextEditingController idController,TextEditingController nameController, TextEditingController designationController) {
    idController.clear();
    nameController.clear();
    designationController.clear();
    notifyListeners();
  }

}