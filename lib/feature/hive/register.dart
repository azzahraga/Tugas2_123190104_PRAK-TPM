import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile_b/feature/shared_pref/login.dart';
import 'package:mobile_b/model/contact_list_model.dart';
import 'package:mobile_b/tools/common_submit_button.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  Box<ContactListModel> localDB = Hive.box<ContactListModel>("contact_list");

  TextEditingController _unameController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Container(
          child: Column(
            children: [
              TextFormField(
                controller: _unameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  hintText: "Username",
                ),
              ),
              TextFormField(
                controller: _passController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    hintText: "Password"
                ),
              ),
              SizedBox(height: 20,),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildSubmitButton() {
    return CommonSubmitButton(
        labelButton: "Register",
        submitCallback: (value) {
          localDB.add(ContactListModel(username: _unameController.text, password: _passController.text));
          setState(() {});
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>SharedPrefPage()));
        });
  }

  // Widget _buildSubmitButton() {
  //   return Expanded(
  //     child: ValueListenableBuilder(
  //         valueListenable: localDB.listenable(),
  //         builder: (BuildContext context, Box<dynamic> value, Widget? child) {
  //           if (value.isEmpty) {
  //             return Center(
  //               child: Text("Data Kosong"),
  //             );
  //           }
  //
  //           return ListView.builder(
  //             itemBuilder: (BuildContext context, int index) {
  //               return Text("${localDB.getAt(index)!.name}");
  //             },
  //             itemCount: localDB.length,
  //           );
  //         }),
  //   );
  // }
}
