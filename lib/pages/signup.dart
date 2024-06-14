import 'package:antrian_puskesmas/pages/home.dart';
import 'package:antrian_puskesmas/pages/login.dart';
import 'package:antrian_puskesmas/services/database.dart';
import 'package:antrian_puskesmas/services/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? name, mail, password;

  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null && name != null && mail != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mail!, password: password!);
        String id = randomAlphaNumeric(10);
        await SharedpreferenceHelper().saveUserName(namecontroller.text);
        await SharedpreferenceHelper().saveUserEmail(emailcontroller.text);
        await SharedpreferenceHelper().saveUserImage(
            "https://firebasestorage.googleapis.com/v0/b/barberapp-ebcc1.appspot.com/o/icon1.png?alt=media&token=0fad24a5-a01b-4b67-b4a0-676fbc75b4a");
        await SharedpreferenceHelper().saveUserId(id!);
        Map<String, dynamic> userInfoMap = {
          "Name": namecontroller.text,
          "Email": emailcontroller.text,
          "id": id,
          "Image":
              "https://firebasestorage.googleapis.com/v0/b/barberapp-ebcc1.appspot.com/o/icon1.png?alt=media&token=0fad24a5-a01b-4b67-b4a0-676fbc75b4a"
        };
        await DatabaseMethods().addUserDetails(userInfoMap, id);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 20.0),
        )));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Password Provided is too weak",
            style: TextStyle(fontSize: 20.0),
          )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Account already exists",
            style: TextStyle(fontSize: 20.0),
          )));
        }
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
                  "Create Your\n Account! ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
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
                        "Name",
                        style: TextStyle(
                            color: Color.fromARGB(216, 117, 185, 22),
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                      TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                          controller: namecontroller,
                          decoration: InputDecoration(
                              hintText: "Name",
                              prefixIcon: Icon(Icons.person_outline))),
                      SizedBox(
                        height: 10.0,
                      ),
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
                        height: 60.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              mail = emailcontroller.text;
                              name = namecontroller.text;
                              password = passwordcontroller.text;
                            });
                          }
                          registration();
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
                              child: Text("SIGN UP",
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
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                                color: Color(0xff311937),
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("SIGN IN",
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
            ],
          ),
        ),
      ),
    );
  }
}
