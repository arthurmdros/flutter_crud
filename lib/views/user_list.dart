import 'package:crud/data/dummy_users.dart';
import 'package:crud/models/user.dart';
import 'package:crud/provider/users_provider.dart';
import 'package:crud/components/user_tile.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final Users users = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de usuários'),
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
          }, icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.all.elementAt(i)),
      ),
    );
  }
}