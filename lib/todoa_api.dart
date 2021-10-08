import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';



class TodosApi extends StatefulWidget {
  const TodosApi({Key? key}) : super(key: key);

  @override
  _TodosApiState createState() => _TodosApiState();
}

class _TodosApiState extends State<TodosApi> {

  List<Map<String,dynamic>> qutations=[];

  Future<void>  toDoApi() async {
    Response res =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    print(res.body);
    if(res.statusCode==200){
      qutations=jsonDecode(res.body).cast<Map<String,dynamic>>();
      setState(() {
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toDoApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: qutations.isNotEmpty? RefreshIndicator(
        onRefresh: toDoApi,
        child: ListView.builder(
          itemCount: qutations.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title:  Text(qutations[index]['title']),
           subtitle:  Text(qutations[index]['completed'].toString()),
                trailing:  qutations[index]['completed']?Icon(Icons.check):Icon(Icons.clear)
              ),
            );
          },
        ),
      ):const CircularProgressIndicator(),
    );
  }
}

