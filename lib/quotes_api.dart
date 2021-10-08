import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class JsonApi extends StatefulWidget {
  const JsonApi({Key? key}) : super(key: key);

  @override
  _JsonApiState createState() => _JsonApiState();
}

class _JsonApiState extends State<JsonApi> {
  List<Map<String,dynamic>> qutations=[];


 Future<void>  loadDataFromApi() async {
    Response res =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
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
    loadDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: qutations.isNotEmpty? RefreshIndicator(
        onRefresh: loadDataFromApi,
        child: ListView.builder(
            itemCount: qutations.length,
          itemBuilder: (context,index){
              return ListTile(
                title:  Text(qutations[index]['username']),
                subtitle:  Text(qutations[index]['address']['geo']['lat'].toString()),
              );
          },
            ),
      ):const CircularProgressIndicator(),
    );
  }
}
