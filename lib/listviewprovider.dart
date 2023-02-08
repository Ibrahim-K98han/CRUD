import 'package:flutter/material.dart';

import 'listviewdatamodel.dart';

class ListViewDataProvider with ChangeNotifier{
   final List<ListViewDataModel> _infoList = [
   ListViewDataModel(id: 1, name: 'Ibrahim', designation: 'Flutter Developer'),
   ListViewDataModel(id: 2, name: 'Hasan', designation: 'Android Developer'),
 ];
   List<ListViewDataModel> get info => _infoList;  
}