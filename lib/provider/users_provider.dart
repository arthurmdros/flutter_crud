import 'dart:math';

import 'package:crud/data/dummy_users.dart';
import 'package:crud/models/user.dart';
import 'package:flutter/cupertino.dart';

class Users with ChangeNotifier{
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i){
    return _items.values.elementAt(i);
  }

  void submit (User user){
    if(user == null) return;

    if( user.id != null && user.id.toString().trim().isNotEmpty && _items.containsKey(user.id)){
      _items.update(user.id.toString(), (_) => User(
          id: user.id,
          name: user.name, 
          email: user.email,
          avatarUrl: user.avatarUrl
        )
      );
    }else{
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, () => User(
        id: id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl
      )); 
    }
    notifyListeners();
  }

  void remove(User user){
    if(user != null && user.id != null){
      _items.remove(user.id);
      notifyListeners();
    }
  }
}