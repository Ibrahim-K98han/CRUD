import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:student_info/data_provider.dart';

import 'model.dart';


class HomePage extends StatelessWidget {
  final nameController = TextEditingController();

  final idController = TextEditingController();

  final designationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context,dataProvider,child) {
        return Scaffold(
          appBar: AppBar(title: Text('Home Page'),),
          body: Column(
            children: [
              SizedBox(
                height: 300,
                child: ListView.builder(
                  shrinkWrap: true,  
                scrollDirection: Axis.vertical,
                itemCount: dataProvider.infoList.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Stack(
                      children: [
                        Card(
                        color: Colors.green,
                        child: ListTile(
                          title: Text('${dataProvider.infoList[index].name}',style: TextStyle(color: Colors.white),),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text('${dataProvider.infoList[index].id}',style: TextStyle(color: Colors.white)),
                            Text('${dataProvider.infoList[index].designation}',style: TextStyle(color: Colors.white)),
                          ]),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: (){
                            dataProvider.deleteData(dataProvider.infoList[index]);
                          },
                          child: Icon(Icons.clear)
                          )
                        )
                      ],
                    ),
                  );
                }
                ),
              ),
              ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AlertDialog(
            title: const Text('Add Student'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                  children: [
                TextFormField(
                   controller: nameController,
                   decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Name : ',
                ),
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
                ),
                SizedBox(height: 10,),
                 TextFormField(
                  keyboardType: TextInputType.number,
                   controller: idController,
                   decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter ID : ',
                ),
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
                ),
                SizedBox(height: 10,),
                 TextFormField(
                   controller: designationController,
                   decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Designation : ',
                ),
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
                )
              
                  ],
                )),
               
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                      dataProvider.addData(int.tryParse(idController.text)!, nameController.text, designationController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Successfull Data Inserted')),
                    ); 
                   
                  }
                  dataProvider.clearInfo(idController, nameController, designationController);
                //  Navigator.pop(context, 'OK');
                
                } ,
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
      child: const Text('Add'),
    )
            ],
          ),
        );
      }
    );
  }
}