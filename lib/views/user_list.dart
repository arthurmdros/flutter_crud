import 'package:crud/data/dummy_users.dart';
import 'package:crud/views/user_file.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final users = {...DUMMY_USERS};
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de usuários'),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i)),
      ),
    );
  }
}