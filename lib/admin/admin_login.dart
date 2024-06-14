import 'package:antrian_puskesmas/admin/booking_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                "Admin\nLogin ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 40.0, left: 30.0, right: 30.0, bottom: 30.0),
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(40))),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                          color: Color.fromARGB(216, 117, 185, 22),
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500),
                    ),
                    TextFormField(
                        controller: usernamecontroller,
                        decoration: InputDecoration(
                            hintText: "Username",
                            prefixIcon: Icon(Icons.mail_outline))),
                    Text(
                      "Password",
                      style: TextStyle(
                          color: Color.fromARGB(216, 117, 185, 22),
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500),
                    ),
                    TextFormField(
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
                        loginAdmin();
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
                            child: Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold)),
                          )),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  loginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['username'] != usernamecontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Your username is not correct",
            style: TextStyle(fontSize: 20.0),
          )));
        } else if (result.data()['password'] !=
            passwordcontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Your password is not correct",
            style: TextStyle(fontSize: 20.0),
          )));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BookingAdmin()));
        }
      });
    });
  }
}
