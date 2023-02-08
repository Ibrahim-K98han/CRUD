import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:student_info/list_view_details_page.dart';

import 'listviewdatamodel.dart';
import 'listviewprovider.dart';

class ListViewData extends StatelessWidget {
  const ListViewData({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ListViewDataProvider>(
      builder: (context, provider, _){
        return Scaffold(appBar: AppBar(title: Text('Home'),),
          body: Column(
            children: [
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: provider.info.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green,
                        ),
                        height: 100,
                        child: Center(
                          child: ListTile(
                            title: Text(provider.info[index].name,style: TextStyle(color: Colors.white),),
                            subtitle: Text(provider.info[index].designation,style: TextStyle(color: Colors.white),),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>ListViewDetailsPage(),settings: RouteSettings(arguments: provider.info[index],
                  ),));
                            },
                            ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
                onPressed: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>ListViewDetailsPage(info: provider.info,),));
                }, 
                child: Text('Click')
                )
            ],
          )
       );
      },
    );
  }
}