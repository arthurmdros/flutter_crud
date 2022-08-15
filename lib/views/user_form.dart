import 'package:crud/models/user.dart';
import 'package:crud/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  
  UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Formulário do usuário'),
        actions: [
          IconButton(
            onPressed: () { 
              final isValid = _form.currentState!.validate();
              if(isValid){
                _form.currentState!.save();
                Provider.of<Users>(context, listen: false).submit(User(
                  id: _formData['id'],
                  name: _formData['name']!,
                  email: _formData['email']!,
                  avatarUrl: _formData['avatarUrl']!,
                ));
                Navigator.of(context).pop();
              }
            }, 
            icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return 'Nome inválido!';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value.toString(),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _formData['email'] = value.toString(),),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL do avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value.toString(),)
            ],
          )
        ),),
    );
  }
}