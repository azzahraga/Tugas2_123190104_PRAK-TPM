import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:mobile_b/dashboard.dart';
import 'package:mobile_b/feature/hive/register.dart';
import 'package:mobile_b/model/contact_list_model.dart';
import 'package:mobile_b/tools/common_submit_button.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefPage extends StatefulWidget {
  const SharedPrefPage({Key? key}) : super(key: key);

  @override
  _SharedPrefPageState createState() => _SharedPrefPageState();
}

class _SharedPrefPageState extends State<SharedPrefPage> {

  bool status = false;
  // Box<ContactListModel> localDB = Hive.box<ContactListModel>("contact_list");
  final Future<SharedPreferences> _myPref = SharedPreferences.getInstance();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final String usernameDB = "mobile";
  final String passwordDB = "mobile123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Container(
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  hintText: "Username",
                ),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    hintText: "Password"
                ),
              ),
              SizedBox(height: 20,),
              _buildLoginButton(),
              SizedBox(height: 20,),
              _buildRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(){
    return CommonSubmitButton(
        labelButton: "Login",
        submitCallback: (value){
          String currentUsername = _usernameController.value.text;
          String currentPassword = _passwordController.value.text;

          _prosesLogin(currentUsername, currentPassword);
        }
    );
  }

  Widget _buildRegisterButton(){
    return CommonSubmitButton(
        labelButton: "Register",
        submitCallback: (String value){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>Register())
          );
        }
    );
    // return CommonSubmitButton(
    //     labelButton: "Register",
    //     submitCallback: (value){
    //       _prosesLogout();
    //     }
    // );
  }

  void _prosesLogin(String username, String password) async{
    if(username == usernameDB && password == passwordDB){
      SharedPreferences getPref = await _myPref;
      await getPref.setBool("loginStatus", true);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) =>Dashboard())
      );
    }
  }
  // void _prosesLogout() async {
  //   SharedPreferences getPref = await _myPref;
  //   await getPref.setBool("loginStatus", false);
  // }

}


