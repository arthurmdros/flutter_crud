import 'package:crud/models/user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context)  {
    final avatar = user.avatarUrl == null || user.avatarUrl.toString().isEmpty ?
      CircleAvatar(child: Icon(Icons.person)) :
      CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl.toString()));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(onPressed: (){}, color: Colors.indigoAccent, icon: Icon(Icons.edit)),
            IconButton(onPressed: (){}, color: Colors.redAccent, icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}