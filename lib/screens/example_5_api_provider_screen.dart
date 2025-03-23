import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_projects/provider/example_5_api_provider.dart';

class ApiProviderScreen extends StatefulWidget {
  const ApiProviderScreen({super.key});

  @override
  State<ApiProviderScreen> createState() => _ApiProviderScreenState();
}

class _ApiProviderScreenState extends State<ApiProviderScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ApiProvider>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Users List"),),
      body: apiProvider.isLoading
          ? Center(child: CircularProgressIndicator(),)
          : ListView.builder(
        itemCount: apiProvider.users.length,
        itemBuilder: (context,index){
          final user = apiProvider.users[index];
          return ListTile(
            title: Text(apiProvider.users[index].name),
            subtitle: Text(user.email),
          );
        },),
    );
  }
}
