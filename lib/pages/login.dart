import 'package:antrian_puskesmas/pages/home.dart';
import 'package:antrian_puskesmas/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? mail, password;

  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();
  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail!, password: password!);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No User Found for that Email",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Wrong Password Provided by User",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50.0, left: 30.0),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(216, 117, 185, 22),
                  Color.fromARGB(255, 29, 98, 53),
                  Color.fromARGB(255, 33, 55, 25)
                ])),
                child: Text(
                  "Hello\n Sign in! ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      mail = emailcontroller.text;
                      password = passwordcontroller.text;
                    });
                    userLogin();
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: 40.0, left: 30.0, right: 30.0, bottom: 30.0),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 4),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(40))),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gmail",
                          style: TextStyle(
                              color: Color.fromARGB(216, 117, 185, 22),
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500),
                        ),
                        TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
                              }
                              return null;
                            },
                            controller: emailcontroller,
                            decoration: InputDecoration(
                                hintText: "Gmail",
                                prefixIcon: Icon(Icons.mail_outline))),
                        Text(
                          "Password",
                          style: TextStyle(
                              color: Color.fromARGB(216, 117, 185, 22),
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password_outlined),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Forgot password?",
                                style: TextStyle(
                                    color: Color(0xff311937),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                mail = emailcontroller.text;
                                password = passwordcontroller.text;
                              });
                              userLogin();
                            }
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color.fromARGB(216, 117, 185, 22),
                                    Color.fromARGB(255, 29, 98, 53),
                                    Color.fromARGB(255, 33, 55, 25)
                                  ]),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Text("SIGN IN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold)),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("don't have account?",
                                style: TextStyle(
                                    color: Color(0xff311937),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("SIGN UP",
                                  style: TextStyle(
                                      color: Color(0xff311937),
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
