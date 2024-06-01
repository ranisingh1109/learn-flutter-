import 'package:flutter/material.dart';
import 'package:unsplash_project/unsplash_services_api.dart';

class UnsplashScreen extends StatefulWidget {
  const UnsplashScreen({super.key});

  @override
  State<UnsplashScreen> createState() => _UnsplashScreenState();
}

class _UnsplashScreenState extends State<UnsplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: UnsplashServices().getData(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          return ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 35,
                  backgroundImage:
                      NetworkImage("${data?[index].user?.profileImage?.small}"),
                ),
                title: Text('${data?[index].user?.name}'),
                subtitle: Text('${data?[index].user?.firstName}'),
              );
            },
          );
        },
      ),
    );
  }
}
