import 'package:antrian_puskesmas/pages/login.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 120.0),
        child: Column(
          children: [
            Image.asset("images/logo.png"),
            SizedBox(
              height: 50.0,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(216, 117, 185, 22),
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Mulai Ambil Antrian",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
