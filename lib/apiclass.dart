
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}): super(key: key);
  @override
  State<HomeScreen> createState()=>_HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen>{
  List <dynamic> users=[];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,


      title:Center(child: const Text('Rest APi', ))
      ),
    body: ListView.builder( itemCount:users.length, itemBuilder:(context,index){
      final user=users[index];
      final name=user['name']['first'];
      final email=user['email'];
      final gender=user['gender'];
      final color= gender=='female' ? Colors.cyanAccent: Colors.lightBlueAccent;

      return ListTile(
    tileColor: color,

        title: Text(name),
        trailing:Text(gender,),
        leading: CircleAvatar(child: Text('${index + 1}'), backgroundColor: Colors.cyanAccent,
        ),
        subtitle: Text(email),
      );


}),



   floatingActionButton: FloatingActionButton(
     backgroundColor: Colors.blue,

     onPressed: fetchUsers,
   ),
    );
  }
  void fetchUsers() async{
    print('fetchUsers called');
    const url= 'https://randomuser.me/api/?results=100';
    final uri=Uri.parse(url);
    final response=await http.get(uri);
    final body=response.body;
    final json =jsonDecode(body);
    setState((){
      users=json['results'];
    });
    print('fetch users completed');

  }
}


