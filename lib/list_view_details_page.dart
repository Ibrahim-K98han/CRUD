// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:provider/provider.dart';
// import 'package:student_info/listviewdatamodel.dart';
// import 'listviewprovider.dart';

// class ListViewDetailsPage extends StatelessWidget {
//   final List<ListViewDataModel> info;
//   ListViewDetailsPage({super.key, required this.info,});

//   @override
//   Widget build(BuildContext context) {
//     //final listof = ModalRoute.of(context)!.settings.arguments as ListViewDataModel;
//     return Scaffold(
//         appBar: AppBar(title: Text('Details Page'),),
//         body:ListView.builder(
//                   itemCount: info.length,
//                   itemBuilder: (context, index){
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           color: Colors.green,
//                         ),
//                         height: 100,
//                         child: Center(
//                           child: ListTile(
//                             title: Text(info[index].name.toString(),style: TextStyle(color: Colors.white),),
//                             subtitle: Text(info[index].designation,style: TextStyle(color: Colors.white),),
//                             ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:student_info/listviewdatamodel.dart';

class ListViewDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listof =
        ModalRoute.of(context)!.settings.arguments as ListViewDataModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green,
          ),
          height: 100,
          child: Center(
            child: ListTile(
              title: Text(
                listof.name,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                listof.designation,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
