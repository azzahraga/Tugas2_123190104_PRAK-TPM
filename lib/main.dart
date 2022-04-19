import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile_b/feature/shared_pref/login.dart';
import 'model/contact_list_model.dart';

void main() async{
  initiateLocalDB();
  runApp(const MyApp());
}
void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ContactListModelAdapter());
  await Hive.openBox<ContactListModel>("contact_list");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SharedPrefPage()
    );
  }

  Widget build_home() {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text("Praktikum Mobile - B"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.call,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.call,
                  color: Colors.white,
                )),
          ],
        ),
        body:
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                color: const Color(0xffeeee00),
                height: 400.0,
                alignment: Alignment.center,
                child: const Text('Fixed Height Content'),
              ),
              Container(
                color: const Color(0xff008000),
                height: 450.0,
                alignment: Alignment.center,
                child: const Text('Fixed Height Content'),
              ),
            ],
          ),
        ));
  }
}