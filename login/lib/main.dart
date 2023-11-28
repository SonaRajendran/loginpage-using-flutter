import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController contact = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WELCOME LOGIN PAGE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                    labelText: 'Name', hintText: 'enter your name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    // RegExp(r'^[a-z A-Z]').hasMatch(value)) {
                    return 'please enter name';
                  }
                  /*if (!nameRegExp.hasMatch(value)) {
                    return 'please enter valid name';
                  }*/
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                    labelText: 'Email', hintText: 'enter your Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter correct email';
                  }
                  RegExp emailRegExp =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegExp.hasMatch(value)) {
                    return 'please enter valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password', hintText: 'enter your Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter valid Password';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: contact,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'contact',
                    hintText: 'enter your contact number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter contact number';
                  }
                  if (value.length != 10) {
                    return 'please enter a 10 digit phone number';
                  }
                  /* RegExp contactRegExp =
                  RegExp(r'^[+]*[(]{0,1}[0,9]{1,4}[)][-\s\./8-9]$');
                  if (!contactRegExp.hasMatch(value)) {
                    return 'please enter valid contact';
                  }*/
                  else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 16.0),
              InkWell(
                onTap: () {
                  _login();
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  color: Colors.red,
                  child: Text(
                    'login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    if (formkey.currentState!.validate()) {
      _showDialog();
    }
    ;
  }

  /* Void  _login(){
    formkey.currentState!.validate() {
      _showDialog();
    };
  }*/

  //void showDialog(FormFieldState formFieldState, {required Object context, required AlertDialog Function(BuildContext context) builder}) {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext contextcontext) {
        return AlertDialog(
          title: Text('Log in Successfull'),
          content: Text('Thanks for logging in!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('This is your Home Page'),
      ),
    );
  }
}
