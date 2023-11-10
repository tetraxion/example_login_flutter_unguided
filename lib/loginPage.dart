import 'package:flutter/material.dart';
import 'package:praktikum_modul_7_login_unguided/homePage.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  late String _email;
  late String _pass;
  String _errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: const Color.fromARGB(255, 36, 78, 112),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Container(
                  height: 200,
                  width: 190,
                  padding: EdgeInsets.only(top: 40, bottom: 30),
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
                onChanged: (text) {
                  _email = text;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 10, left: 10, bottom: 50),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
                onChanged: (text) {
                  _pass = text;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 36, 78, 112), borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    if (_email == "lutfi@gmail.com" && _pass == "12345") {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      _errorMessage = "Email atau Password Salah";
                    }
                  });
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
