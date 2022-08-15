import 'package:crud/models/user.dart';
import 'package:crud/provider/users_provider.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            IconButton(onPressed: (){
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM, arguments: user);
            }, color: Colors.indigoAccent, icon: Icon(Icons.edit)),
            IconButton(onPressed: (){
              showDialog(
                context: context, 
                builder: (ctx) => AlertDialog(
                  title: Text('Excluir usuário'),
                  content: Text('Deseja excluir o usuário: ' + user.name + ' ?'),
                  actions: [
                    TextButton(
                        child: Text('Não'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      TextButton(
                        child: Text('Sim'),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                  ],
                )).then((confirmed) {
                  if (confirmed) {
                    Provider.of<Users>(context, listen: false).remove(user);
                  }
                });
            }, color: Colors.redAccent, icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}