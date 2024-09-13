import 'dart:math';

import 'package:flutter/material.dart';
import 'package:your_barber/data/dummy_users.dart';
import 'package:your_barber/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, CadastroUser> _items = {...DUMMY_USERS};

  List<CadastroUser> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  CadastroUser byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(CadastroUser users) {
    // ignore: unnecessary_null_comparison
    if (users == null) {
      return;
    }

    if (users.id != null &&
        users.id!.trim().isNotEmpty &&
        _items.containsKey(users.id)) {
          _items.update(
            users.id!,
            (_) => CadastroUser(
              id: users.id,
              name: users.name,
              email: users.email,
              password: users.password));
    } else {
      var id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => CadastroUser(
            id: id = id,
            name: users.name,
            email: users.email,
            password: users.password));
    }
    notifyListeners();
  }
}
