
import 'package:flutter/material.dart';

import '../modal/homescreen_model.dart';

class studentdata_provider extends ChangeNotifier
{
  List<student_model> storeStudentData = [];

  void add(student_model s1)
  {
    storeStudentData.add(s1);
    notifyListeners();
  }

  void remove(int index)
  {
    storeStudentData.removeAt(index);
    notifyListeners();
  }

  void update(int index,student_model s1)
  {
    storeStudentData[index]=s1;
    notifyListeners();
  }
}