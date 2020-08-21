import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Dashboard.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  runApp(MaterialApp(home: email == null ? Login() : Dashboard(),));
}



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String email = "shawon@gmail.com";
  String password = "123";

  Future checkLogin()async{
    if (emailController.text == email && passController.text == password) {
      
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('email', emailController.text);
     
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard(),),);
      Fluttertoast.showToast(
        msg: "Login Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }else{
      Fluttertoast.showToast(
        msg: "Username & Password Invalid!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Login',style: TextStyle(fontSize: 25,fontFamily: 'Nasalization'),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(labelText:'Username'),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passController,
              decoration: InputDecoration(labelText:'Password'),),
          ),
          SizedBox(height: 10,),
          MaterialButton(
            color: Colors.pink,
            onPressed: (){
            checkLogin();
          },child: Text('Login',style: TextStyle(color: Colors.white)),),
        ],
      ),
    );
  }
}
