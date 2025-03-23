import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_projects/model/UserModel.dart';

class ApiProvider extends ChangeNotifier{
  List<UserModel> _users = [];
  bool _isLoading = false ;

  List<UserModel> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers()async{
    _isLoading = true;
    notifyListeners();

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _users = data.map((json) => UserModel.fromJson(json)).toList();
    }

    _isLoading = false;
    notifyListeners();
  }
}

