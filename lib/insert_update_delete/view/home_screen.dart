import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insert_update_delete_pro/insert_update_delete/modal/homescreen_model.dart';
import 'package:insert_update_delete_pro/insert_update_delete/provider/insert_update_delete_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController txtname =  TextEditingController();
  TextEditingController txtstd =  TextEditingController();
  TextEditingController txtid =  TextEditingController();

  TextEditingController dtxtname =  TextEditingController();
  TextEditingController dtxtstd =  TextEditingController();
  TextEditingController dtxtid =  TextEditingController();

  studentdata_provider? pro_stu;
  @override
  Widget build(BuildContext context) {
    pro_stu = Provider.of<studentdata_provider>(context,listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Student Data"), centerTitle: true),
          body: Column(
            children: [
              TextField(controller: txtid,
              decoration: InputDecoration(hintText: "Enter Id"),
              ),
              TextField(controller: txtname,
                decoration: InputDecoration(hintText: "Enter Name"),
              ),
              TextField(controller: txtstd,
                decoration: InputDecoration(hintText: "Enter STD"),
              ),
              ElevatedButton(onPressed: () {
                student_model s1 = student_model(Id: txtid.text,Name: txtname.text,Std: txtstd.text);
                pro_stu!.add(s1);
                txtstd.clear();
                txtname.clear();
                txtid.clear();
              }, child: Text("Add")),
              Expanded(
                child: Consumer<studentdata_provider>(
                  builder: (context, value, child) => ListView.builder(
                    itemCount: pro_stu!.storeStudentData.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text("${pro_stu!.storeStudentData[index].Id}"),
                      title: Text("${pro_stu!.storeStudentData[index].Name}"),
                      subtitle: Text("${pro_stu!.storeStudentData[index].Std}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: () {
                            pro_stu!.remove(index);
                          }, icon: Icon(Icons.delete,color: Colors.red,)),
                          IconButton(onPressed: () {
                            dtxtid = TextEditingController(text: "${pro_stu!.storeStudentData[index].Id}");
                            dtxtname = TextEditingController(text: "${pro_stu!.storeStudentData[index].Name}");
                            dtxtstd = TextEditingController(text: "${pro_stu!.storeStudentData[index].Std}");
                            showDialog(context: context, builder: (context) => AlertDialog(
                              content: Column(
                                 mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(controller: dtxtid,),
                                  TextField(controller: dtxtname,),
                                  TextField(controller: dtxtstd,),
                                ],
                              ),
                              actions: [
                                ElevatedButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child: Text("Cancle")),
                                ElevatedButton(onPressed: () {
                                  student_model s1 = student_model(Std: dtxtstd.text,Name: dtxtname.text,Id: dtxtid.text);
                                  pro_stu!.update(index, s1);
                                  Navigator.pop(context);
                                }, child: Text("Done"))
                              ],
                            ),);
                          }, icon: Icon(Icons.edit))
                        ],
                      ),
                    );
                  },),
                ),
              )
            ],
          ),
    ));
  }
}
